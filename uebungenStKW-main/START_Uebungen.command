#!/bin/bash
# =========================================================================
#  START_Uebungen.command  -  Python-Uebungen "Solarthermische Kraftwerke"
#  Gegenstueck zu START_Uebungen.bat fuer macOS (laeuft auch unter Linux).
#
#  Start:  Im Terminal  bash  eintippen (mit Leerzeichen), diese Datei ins
#          Terminal-Fenster ziehen, Enter druecken.
#
#  Es wird KEINE Python-Installation benoetigt. Beim ersten Start wird
#  automatisch (ohne Adminrechte) eingerichtet:
#    - uv      : Paketmanager, eine einzelne Datei von GitHub
#    - Python  : eigene Python-Version nur fuer diese Uebungen
#    - Pakete  : pandas, numpy, matplotlib, scipy, folium, tespy, ...
#  Alles landet in  ~/.csp-uebungen  und kann dort jederzeit geloescht
#  werden. Danach oeffnet sich JupyterLab im Browser.
#
#  Optionen (fuer Uebungsleiter):
#    bash START_Uebungen.command --pruefen      alle Einfuehrungen + Musterloesungen
#                                               testweise komplett ausfuehren
#    bash START_Uebungen.command --neu          Python-Umgebung neu aufsetzen
#    bash START_Uebungen.command --nur-install  nur einrichten, nicht starten
#    Andere Argumente werden an JupyterLab weitergereicht (z.B. --no-browser).
# =========================================================================
set -u
cd "$(dirname "$0")" || exit 1

# ---- Versionen (identisch zu START_Uebungen.bat halten!) ------------------
#  tespy MUSS 0.9.x bleiben: ab 0.10 laufen Uebung 03 und 04 nicht mehr.
#  argon2-cffi-bindings 25.1.0: neuere Version hat keine Intel-Mac-Pakete.
UV_VERSION="0.12.19"
PY_VERSION="3.11"
PACKAGES="jupyterlab==4.6.4 notebook==7.6.3 ipykernel==7.3.0 pandas==3.0.6 numpy==2.4.6 matplotlib==3.11.2 scipy==1.17.1 openpyxl==3.1.5 folium==0.20.0 CoolProp==8.0.0 tespy==0.9.16.post3 argon2-cffi-bindings==25.1.0"
export UV_EXCLUDE_NEWER="2026-09-28T00:00:00Z"
START_NOTEBOOK="00_START_Uebersicht.ipynb"

# ---- Alles in einem eigenen Ordner, nichts Globales anfassen --------------
APPDIR="$HOME/.csp-uebungen"
UVDIR="$APPDIR/uv-$UV_VERSION"
UV="$UVDIR/uv"
VENV="$APPDIR/venv"
PY="$VENV/bin/python"

export UV_CACHE_DIR="$APPDIR/cache"
export UV_PYTHON_INSTALL_DIR="$APPDIR/python"
export UV_PYTHON_PREFERENCE="only-managed"
export UV_NO_CONFIG=1
unset VIRTUAL_ENV CONDA_PREFIX PYTHONHOME PYTHONPATH JUPYTER_PATH
export PYTHONNOUSERSITE=1
export PIP_DISABLE_PIP_VERSION_CHECK=1
#  Eigene Jupyter-Einstellungen, damit alte Anaconda-Kernel nicht stoeren
export JUPYTER_CONFIG_DIR="$APPDIR/jupyter/config"
export JUPYTER_DATA_DIR="$APPDIR/jupyter/data"
export PATH="$VENV/bin:$PATH"

MODE="start"
case "${1:-}" in
  --pruefen)     MODE="pruefen" ;;
  --neu)         MODE="neu" ;;
  --nur-install) MODE="install" ;;
esac

warte_und_ende() {
  echo
  read -n 1 -s -r -p " Beliebige Taste druecken zum Schliessen ..."
  echo
  exit "$1"
}
fehler() {
  echo
  echo " FEHLER: $1"
  echo " Bitte Internetverbindung pruefen und erneut starten."
  echo " Hilft das nicht:  bash START_Uebungen.command --neu"
  warte_und_ende 1
}

echo
echo " ================================================================"
echo "  Python-Uebungen  Solarthermische Kraftwerke"
echo " ================================================================"
echo
mkdir -p "$APPDIR"

# ---- 1) uv herunterladen (nur beim ersten Mal) -----------------------------
if [ ! -x "$UV" ]; then
  echo " [1/3] Lade Paketmanager uv $UV_VERSION herunter ..."
  case "$(uname -s)-$(uname -m)" in
    Darwin-arm64)  TARGET="aarch64-apple-darwin" ;;
    Darwin-x86_64) TARGET="x86_64-apple-darwin" ;;
    Linux-x86_64)  TARGET="x86_64-unknown-linux-gnu" ;;
    Linux-aarch64) TARGET="aarch64-unknown-linux-gnu" ;;
    *) fehler "Unbekanntes System: $(uname -s) $(uname -m)" ;;
  esac
  mkdir -p "$UVDIR"
  curl -fsSL --retry 3 "https://github.com/astral-sh/uv/releases/download/$UV_VERSION/uv-$TARGET.tar.gz" \
    | tar -xz -C "$UVDIR" --strip-components 1 \
    || fehler "uv konnte nicht heruntergeladen werden (Proxy / Firewall?)."
  [ -x "$UV" ] || fehler "uv konnte nicht heruntergeladen werden."
fi

# ---- 2) Python-Umgebung anlegen (nur beim ersten Mal) ----------------------
if [ "$MODE" = "neu" ] && [ -d "$VENV" ]; then
  echo " Loesche alte Umgebung ..."
  rm -rf "$VENV"
fi
if [ ! -x "$PY" ]; then
  echo " [2/3] Richte Python $PY_VERSION ein ..."
  "$UV" venv --clear --seed --python "$PY_VERSION" "$VENV" \
    || fehler "Python konnte nicht eingerichtet werden."
fi

# ---- 3) Pakete installieren / pruefen --------------------------------------
echo " [3/3] Pruefe Python-Pakete ..."
#  Zuerst offline versuchen (schnell, klappt ohne Internet sobald alles da ist)
# shellcheck disable=SC2086
if ! "$UV" pip install --quiet --offline --python "$PY" $PACKAGES >/dev/null 2>&1; then
  echo "       Installiere Pakete - beim ersten Mal dauert das 1-3 Minuten ..."
  # shellcheck disable=SC2086
  "$UV" pip install --python "$PY" $PACKAGES \
    || fehler "Die Python-Pakete konnten nicht installiert werden."
fi

#  JupyterLab: Werbe-/Update-Hinweise abschalten
LABSET="$VENV/share/jupyter/lab/settings"
mkdir -p "$LABSET"
[ -f "$LABSET/overrides.json" ] || \
  echo '{"@jupyterlab/apputils-extension:notification": {"fetchNews": "false", "checkForUpdates": false}}' > "$LABSET/overrides.json"

echo "       Alles bereit."
echo
[ "$MODE" = "install" ] && exit 0

# ---- Test aller Einfuehrungen und Musterloesungen (fuer Uebungsleiter) -----
if [ "$MODE" = "pruefen" ]; then
  PRUEFDIR="${TMPDIR:-/tmp}/csp-uebungen-pruefung"
  mkdir -p "$PRUEFDIR"
  export MPLBACKEND=Agg
  FEHLER=0
  echo " Fuehre alle Einfuehrungen und Musterloesungen aus."
  echo " Die Originaldateien werden dabei NICHT veraendert."
  echo
  for F in \
    01/exercise_01_introduction.ipynb \
    01/exercise_01-solution.ipynb \
    02/uebung_02_introduction.ipynb \
    02/exercise_02.ipynb \
    03/uebung_03_introduction.ipynb \
    03/exercise_03-solution.ipynb \
    04/exercise_04-solution.ipynb
  do
    echo " - $F"
    if [ ! -f "$F" ]; then
      echo "      FEHLT"; FEHLER=$((FEHLER + 1)); continue
    fi
    LOG="$PRUEFDIR/$(basename "$F" .ipynb).log"
    if "$PY" -m jupyter nbconvert --to notebook --execute \
         --ExecutePreprocessor.timeout=900 --output-dir "$PRUEFDIR" "$F" >"$LOG" 2>&1; then
      echo "      ok"
    else
      echo "      FEHLER:"; grep "Error" "$LOG"; FEHLER=$((FEHLER + 1))
    fi
  done
  echo
  if [ "$FEHLER" -eq 0 ]; then
    echo " ERGEBNIS: Alle Notebooks laufen fehlerfrei durch."
  else
    echo " ERGEBNIS: Fehler in $FEHLER Notebooks. Details siehe oben."
  fi
  echo " Ausgefuehrte Kopien liegen in: $PRUEFDIR"
  warte_und_ende "$FEHLER"
fi

# ---- 4) JupyterLab starten -------------------------------------------------
[ "$MODE" = "neu" ] && set --
echo " JupyterLab startet jetzt im Browser."
echo
echo "  - Dieses Terminal-Fenster OFFEN LASSEN, solange Sie arbeiten."
echo "  - Beenden: im Browser Menue  File > Shut Down"
echo "    oder in diesem Fenster  Ctrl+C  druecken."
echo "  - Falls sich kein Browser oeffnet: den unten angezeigten Link"
echo "    mit  http://127.0.0.1:...  in den Browser kopieren."
echo
exec "$PY" -m jupyter lab --ServerApp.root_dir=. "$START_NOTEBOOK" ${1+"$@"}
