@echo off
rem =========================================================================
rem  START_Uebungen.bat  -  Python-Uebungen "Solarthermische Kraftwerke" (TUM)
rem
rem  Doppelklick genuegt. Es wird KEINE Python-Installation benoetigt.
rem  Beim ersten Start wird automatisch (ohne Adminrechte) eingerichtet:
rem    - uv      : Paketmanager, eine einzelne .exe von GitHub
rem    - Python  : eigene Python-Version nur fuer diese Uebungen
rem    - Pakete  : pandas, numpy, matplotlib, scipy, folium, tespy, ...
rem  Alles landet in  %LOCALAPPDATA%\Programs\csp-uebungen  und kann dort jederzeit
rem  geloescht werden. Danach oeffnet sich JupyterLab im Browser.
rem
rem  Optionen (fuer Uebungsleiter, per Kommandozeile):
rem    START_Uebungen.bat --pruefen       alle Einfuehrungen + Musterloesungen
rem                                       testweise komplett ausfuehren
rem    START_Uebungen.bat --neu           Python-Umgebung komplett neu aufsetzen
rem    START_Uebungen.bat --nur-install   nur einrichten, JupyterLab nicht starten
rem    Andere Argumente werden an JupyterLab weitergereicht (z.B. --no-browser).
rem =========================================================================
setlocal
chcp 65001 >nul
title Python-Uebungen Solarthermische Kraftwerke
cd /d "%~dp0"

rem ---- Versionen (feste Versionen = jedes Semester dieselbe Umgebung) -----
rem  tespy MUSS 0.9.x bleiben: ab 0.10 laufen Uebung 03 und 04 nicht mehr.
set "UV_VERSION=0.12.19"
set "PY_VERSION=3.11"
set "PACKAGES=jupyterlab==4.6.4 notebook==7.6.3 ipykernel==7.3.0 pandas==3.0.6 numpy==2.4.6 matplotlib==3.11.2 scipy==1.17.1 openpyxl==3.1.5 folium==0.20.0 CoolProp==8.0.0 tespy==0.9.16.post3"
rem  Abhaengigkeiten nur in dem Stand, der beim Testen aktuell war:
set "UV_EXCLUDE_NEWER=2026-09-28T00:00:00Z"
set "START_NOTEBOOK=00_START_Uebersicht.ipynb"

rem ---- Alles in einem eigenen Ordner, nichts Globales anfassen ------------
rem  (bewusst unter "Programs": direkt unter %LOCALAPPDATA% scheitert uv auf
rem   manchen verwalteten TUM-Rechnern beim Einrichten von Python)
set "APPDIR=%LOCALAPPDATA%\Programs\csp-uebungen"
set "UVDIR=%APPDIR%\uv-%UV_VERSION%"
set "UV=%UVDIR%\uv.exe"
set "UVZIP=%APPDIR%\uv.zip"
set "UV_URL=https://github.com/astral-sh/uv/releases/download/%UV_VERSION%/uv-x86_64-pc-windows-msvc.zip"
set "VENV=%APPDIR%\venv"
set "PY=%VENV%\Scripts\python.exe"

set "UV_CACHE_DIR=%APPDIR%\cache"
set "UV_PYTHON_INSTALL_DIR=%APPDIR%\python"
set "UV_PYTHON_PREFERENCE=only-managed"
set "UV_LINK_MODE=copy"
set "UV_NO_CONFIG=1"
set "VIRTUAL_ENV="
set "CONDA_PREFIX="
set "PYTHONHOME="
set "PYTHONPATH="
set "PYTHONNOUSERSITE=1"
set "PIP_DISABLE_PIP_VERSION_CHECK=1"
rem  Eigene Jupyter-Einstellungen, damit alte Anaconda-Kernel nicht stoeren
set "JUPYTER_PATH="
set "JUPYTER_CONFIG_DIR=%APPDIR%\jupyter\config"
set "JUPYTER_DATA_DIR=%APPDIR%\jupyter\data"
set "PATH=%VENV%\Scripts;%PATH%"

set "MODE=start"
if /i "%~1"=="--pruefen" set "MODE=pruefen"
if /i "%~1"=="--neu" set "MODE=neu"
if /i "%~1"=="--nur-install" set "MODE=install"

echo.
echo  ================================================================
echo   Python-Uebungen  Solarthermische Kraftwerke
echo  ================================================================
echo.
if not exist "%APPDIR%" mkdir "%APPDIR%"

rem ---- 1) uv herunterladen (nur beim ersten Mal) ---------------------------
if exist "%UV%" goto :uv_ok
echo  [1/3] Lade Paketmanager uv %UV_VERSION% herunter ...
if not exist "%UVDIR%" mkdir "%UVDIR%"
"%SystemRoot%\System32\curl.exe" -fsSL --retry 3 -o "%UVZIP%" "%UV_URL%"
if not errorlevel 1 goto :uv_unzip
powershell -NoProfile -ExecutionPolicy Bypass -Command "[Net.ServicePointManager]::SecurityProtocol='Tls12'; $ProgressPreference='SilentlyContinue'; Invoke-WebRequest -UseBasicParsing -Uri $env:UV_URL -OutFile $env:UVZIP"
if errorlevel 1 goto :fehler_download
:uv_unzip
"%SystemRoot%\System32\tar.exe" -xf "%UVZIP%" -C "%UVDIR%"
if errorlevel 1 powershell -NoProfile -ExecutionPolicy Bypass -Command "Expand-Archive -Force -LiteralPath $env:UVZIP -DestinationPath $env:UVDIR"
del /q "%UVZIP%" >nul 2>&1
if not exist "%UV%" goto :fehler_download
:uv_ok

rem ---- 2) Python-Umgebung anlegen (nur beim ersten Mal) --------------------
if /i not "%MODE%"=="neu" goto :venv_check
if exist "%VENV%" echo  Loesche alte Umgebung ...
if exist "%VENV%" rmdir /s /q "%VENV%"
:venv_check
if exist "%PY%" goto :venv_ok
echo  [2/3] Richte Python %PY_VERSION% ein ...
"%UV%" venv --clear --seed --python %PY_VERSION% "%VENV%"
if not errorlevel 1 goto :venv_ok
rem  Ausweichort fuer Python, falls der erste Ort blockiert ist
echo        Zweiter Versuch mit anderem Ordner ...
set "UV_PYTHON_INSTALL_DIR=%USERPROFILE%\.csp-uebungen-python"
"%UV%" venv --clear --seed --python %PY_VERSION% "%VENV%"
if errorlevel 1 goto :fehler_python
:venv_ok

rem ---- 3) Pakete installieren / pruefen ------------------------------------
echo  [3/3] Pruefe Python-Pakete ...
rem  Zuerst offline versuchen (schnell, klappt ohne Internet sobald alles da ist)
"%UV%" pip install --quiet --offline --python "%PY%" %PACKAGES% >nul 2>&1
if not errorlevel 1 goto :pakete_ok
echo        Installiere Pakete - beim ersten Mal dauert das 1-3 Minuten ...
"%UV%" pip install --python "%PY%" %PACKAGES%
if errorlevel 1 goto :fehler_pakete
:pakete_ok

rem  JupyterLab: Werbe-/Update-Hinweise abschalten
set "LABSET=%VENV%\share\jupyter\lab\settings"
if not exist "%LABSET%" mkdir "%LABSET%"
if not exist "%LABSET%\overrides.json" (
  echo {"@jupyterlab/apputils-extension:notification": {"fetchNews": "false", "checkForUpdates": false}}
) > "%LABSET%\overrides.json"

echo        Alles bereit.
echo.
if /i "%MODE%"=="install" goto :ende
if /i "%MODE%"=="pruefen" goto :pruefen

rem ---- 4) JupyterLab starten -----------------------------------------------
set "JUPYTER_ARGS=%*"
if /i "%MODE%"=="neu" set "JUPYTER_ARGS="
echo  JupyterLab startet jetzt im Browser.
echo.
echo   - Dieses schwarze Fenster OFFEN LASSEN, solange Sie arbeiten.
echo   - Beenden: im Browser Menue  File ^> Shut Down
echo     oder dieses Fenster schliessen.
echo   - Falls sich kein Browser oeffnet: den unten angezeigten Link
echo     mit  http://127.0.0.1:...  in den Browser kopieren.
echo.
"%VENV%\Scripts\jupyter-lab.exe" --ServerApp.root_dir=. "%START_NOTEBOOK%" %JUPYTER_ARGS%
goto :ende

rem ---- Test aller Einfuehrungen und Musterloesungen (fuer Uebungsleiter) ---
:pruefen
set "PRUEFDIR=%TEMP%\csp-uebungen-pruefung"
if not exist "%PRUEFDIR%" mkdir "%PRUEFDIR%"
set "MPLBACKEND=Agg"
set /a FEHLER=0
echo  Fuehre alle Einfuehrungen und Musterloesungen aus.
echo  Die Originaldateien werden dabei NICHT veraendert.
echo.
for %%F in (
  01\exercise_01_introduction.ipynb
  01\exercise_01-solution.ipynb
  02\uebung_02_introduction.ipynb
  02\exercise_02.ipynb
  03\uebung_03_introduction.ipynb
  03\exercise_03-solution.ipynb
  04\exercise_04-solution.ipynb
) do call :pruefe_eins "%%F"
echo.
if %FEHLER%==0 echo  ERGEBNIS: Alle Notebooks laufen fehlerfrei durch.
if not %FEHLER%==0 echo  ERGEBNIS: Fehler in %FEHLER% Notebooks. Details siehe oben.
echo  Ausgefuehrte Kopien liegen in: %PRUEFDIR%
echo.
pause
exit /b %FEHLER%

:pruefe_eins
echo  - %~1
if not exist "%~1" (
  echo       FEHLT
  set /a FEHLER+=1
  goto :eof
)
"%PY%" -m jupyter nbconvert --to notebook --execute --ExecutePreprocessor.timeout=900 --output-dir "%PRUEFDIR%" "%~1" >"%PRUEFDIR%\%~n1.log" 2>&1
if errorlevel 1 (
  echo       FEHLER:
  findstr /c:"Error" "%PRUEFDIR%\%~n1.log"
  set /a FEHLER+=1
  goto :eof
)
echo       ok
goto :eof

rem ---- Fehlermeldungen -----------------------------------------------------
:fehler_download
echo.
echo  FEHLER: uv konnte nicht heruntergeladen werden.
echo  Bitte Internetverbindung pruefen (Proxy / Firewall / eduroam?).
echo  Adresse: %UV_URL%
goto :ende_fehler

:fehler_python
echo.
echo  FEHLER: Python konnte nicht eingerichtet werden.
echo  Bitte Internetverbindung pruefen und erneut starten.
echo  Hilft das nicht:  START_Uebungen.bat --neu
goto :ende_fehler

:fehler_pakete
echo.
echo  FEHLER: Die Python-Pakete konnten nicht installiert werden.
echo  Bitte Internetverbindung pruefen und erneut starten.
echo  Hilft das nicht:  START_Uebungen.bat --neu
goto :ende_fehler

:ende_fehler
echo.
pause
exit /b 1

:ende
endlocal
exit /b 0
