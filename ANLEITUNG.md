# Anleitung: Python-Übungen starten

**Am einfachsten sind Weg A (Windows) und Weg B (Mac):** Sie müssen dafür nichts selbst
installieren – ein Starter richtet alles automatisch ein.
Wer Python lieber dauerhaft selbst installieren möchte (z. B. um auch mit VS Code zu arbeiten),
nimmt **Weg C** (Python von python.org) oder **Weg D** (conda/Miniforge).

| Ihr Gerät | Empfohlener Weg |
|---|---|
| Windows-PC / -Laptop | [Weg A – Windows: Doppelklick](#weg-a--windows-doppelklick) |
| Mac (Apple Silicon oder Intel) | [Weg B – Mac: ein Befehl im Terminal](#weg-b--mac-ein-befehl-im-terminal) |
| Linux | Weg B funktioniert genauso |
| iPad / Tablet | leider nicht möglich – bitte bei der Übungsleitung melden |
| Python selbst installieren | [Weg C – python.org](#weg-c--manuelle-installation-mit-python-von-pythonorg-allgemein) oder [Weg D – Miniforge](#weg-d--manuelle-installation-mit-miniforge-conda) |

---

## Schritt 0 (für alle): Übungen herunterladen

1. Öffnen Sie **<LINK-ZUM-REPO>**
2. Klicken Sie auf den grünen Button **„Code“** → **„Download ZIP“**
3. **ZIP-Datei entpacken** ⚠️ *wichtig*
   - **Windows:** Rechtsklick auf die ZIP-Datei → **„Alle extrahieren…“** → einen Ort wählen,
     den Sie wiederfinden, z. B. `Dokumente\Uebungen`.
     Bitte **nicht** direkt aus der ZIP-Datei heraus starten – das funktioniert nicht.
   - **Mac:** Safari entpackt die ZIP-Datei meist automatisch im Ordner *Downloads*.
     Falls nicht: ZIP-Datei doppelklicken. Den entpackten Ordner können Sie z. B. nach
     *Dokumente* verschieben.

Im entpackten Ordner sehen Sie u. a. die Ordner `01` bis `04`, `START_Uebungen.bat`
und `START_Uebungen.command`.

---

## Weg A – Windows: Doppelklick

Sie brauchen **kein Python, kein Anaconda und kein VS Code** – nur eine Internetverbindung beim ersten Start.

1. **Starten:** Im entpackten Ordner auf **`START_Uebungen.bat`** doppelklicken.
   - Falls Windows meldet *„Der Computer wurde durch Windows geschützt“*:
     auf **„Weitere Informationen“** → **„Trotzdem ausführen“** klicken.
2. **Beim ersten Start warten** (ca. 2–5 Minuten): Es öffnet sich ein schwarzes Fenster,
   in dem automatisch alles Nötige eingerichtet wird.
3. Danach öffnet sich **JupyterLab im Browser** mit einer **Übersichtsseite**
   → weiter mit [Arbeiten mit JupyterLab](#arbeiten-mit-jupyterlab).

**Beim nächsten Mal:** einfach wieder `START_Uebungen.bat` doppelklicken – das geht dann in
wenigen Sekunden, auch ohne Internet.

---

## Weg B – Mac: ein Befehl im Terminal

Sie brauchen **kein Python, kein Anaconda und kein VS Code** – nur eine Internetverbindung beim ersten Start.

1. **Terminal öffnen:** **Cmd + Leertaste** drücken, `Terminal` eintippen, **Enter**.
2. Im Terminal **`bash`** eintippen, dann **ein Leerzeichen** (noch nicht Enter drücken!).
3. Die Datei **`START_Uebungen.command`** aus dem Finder **in das Terminal-Fenster ziehen**.
   Der Pfad wird automatisch eingefügt. Die Zeile sieht dann etwa so aus:
   ```
   bash /Users/maxmuster/Downloads/uebungen-main/START_Uebungen.command
   ```
4. **Enter** drücken.
   - Falls macOS fragt *„Terminal möchte auf Dateien im Ordner Downloads/Dokumente zugreifen“*:
     **Erlauben** klicken.
5. **Beim ersten Start warten** (ca. 2–5 Minuten): Im Terminal wird automatisch alles Nötige eingerichtet.
6. Danach öffnet sich **JupyterLab im Browser** mit einer **Übersichtsseite**
   → weiter mit [Arbeiten mit JupyterLab](#arbeiten-mit-jupyterlab).

**Beim nächsten Mal:** Schritte 1–4 wiederholen – das geht dann in wenigen Sekunden, auch ohne Internet.

> Ein Doppelklick auf `START_Uebungen.command` funktioniert meist **nicht**
> (macOS blockiert heruntergeladene Skripte). Bitte den Weg über das Terminal nehmen.

---

## Arbeiten mit JupyterLab

| Was? | Wie? |
|:---|:---|
| Übung öffnen | Auf der Übersichtsseite den Link anklicken (öffnet einen neuen Tab) |
| Eine Zelle ausführen | Zelle anklicken, dann **Shift + Enter** |
| Alle Zellen ausführen | Menü **Run → Run All Cells** |
| Neu von vorne rechnen | Menü **Kernel → Restart Kernel and Run All Cells…** |
| Speichern | **Strg + S** (Mac: **Cmd + S**) – wird auch automatisch gespeichert |
| Übung und Lösung nebeneinander | Den Tab der Lösung mit der Maus an den **rechten Rand** ziehen |
| Beenden | Menü **File → Shut Down**, danach Browser-Tab schließen |

- Ihre Änderungen werden direkt in den Dateien im Übungsordner gespeichert.
- **Das schwarze Fenster bzw. das Terminal offen lassen**, solange Sie arbeiten.
- In den Übungsblättern stehen an manchen Stellen Platzhalter `...` – diese Zellen erzeugen
  einen Fehler, bis Sie sie ausgefüllt haben. Das ist so gewollt.

### Probleme?

| Problem | Lösung |
|---|---|
| Es öffnet sich kein Browser | Den Link aus dem schwarzen Fenster / Terminal (beginnt mit `http://127.0.0.1:…`) in den Browser kopieren |
| Fehlermeldung beim ersten Start | Internetverbindung prüfen (eduroam, ggf. VPN aus) und erneut starten |
| Es klappt immer noch nicht | Windows: `START_Uebungen.bat --neu` · Mac: `bash …/START_Uebungen.command --neu` (setzt alles neu auf) |
| Sonstiges | Screenshot vom schwarzen Fenster / Terminal an die Übungsleitung schicken |

Die eingerichtete Python-Umgebung (ca. 600 MB) liegt hier und kann nach dem Semester gelöscht werden:
- **Windows:** `%LOCALAPPDATA%\Programs\csp-uebungen`
- **Mac:** `~/.csp-uebungen` (versteckter Ordner im Benutzerordner)

---

## Weg C – Manuelle Installation mit Python von python.org (allgemein)

Für alle, die Python dauerhaft auf dem eigenen Rechner haben oder mit VS Code arbeiten möchten.
Dieser Weg funktioniert auf jedem Windows-Rechner und Mac und ist der „klassische“ Weg,
wie man Python-Projekte einrichtet. Er besteht aus drei Teilen:

1. **Python installieren** – einmalig pro Rechner
2. **Eine eigene Umgebung für die Übungen anlegen und die Pakete installieren** – einmalig
3. **JupyterLab starten** – jedes Mal

> **Welche Python-Version?** Getestet sind **Python 3.11 und 3.12**. Wir empfehlen
> **Python 3.12.10** – das ist die letzte 3.12-Version, für die es fertige Installer gibt.
> Neuere Versionen (3.13, 3.14, …) bitte **nicht** verwenden: Damit sind die festgelegten
> Paketversionen nicht getestet. Python 3.12 lässt sich problemlos parallel zu anderen
> Python-Versionen installieren.

> **Was ist eine „Umgebung“ (venv)?** Ein eigener Ordner, in dem die Pakete nur für dieses
> Projekt installiert werden. So stören sich verschiedene Projekte nicht gegenseitig, und
> man kann die Umgebung jederzeit löschen und neu anlegen, ohne Python neu zu installieren.

### C1. Python installieren (einmalig)

**Windows**

1. Öffnen Sie <https://www.python.org/downloads/release/python-31210/>, scrollen Sie nach
   unten zu *Files* und laden Sie den **„Windows installer (64-bit)“** herunter
   (`python-3.12.10-amd64.exe`).
2. Installer starten. **Im ersten Fenster ganz unten den Haken bei
   „Add python.exe to PATH“ setzen** ⚠️ – das wird oft vergessen.
   - Haben Sie keine Adminrechte, zusätzlich den Haken bei
     „Use admin privileges when installing py.exe“ **entfernen**.
3. Auf **„Install Now“** klicken und warten.
4. Am Ende ggf. auf **„Disable path length limit“** klicken (falls angeboten), dann **„Close“**.
5. **Prüfen:** Startmenü öffnen, `cmd` eintippen, **Eingabeaufforderung** öffnen und eingeben:
   ```
   py -3.12 --version
   ```
   Es sollte `Python 3.12.10` erscheinen.

**Mac**

1. Öffnen Sie <https://www.python.org/downloads/release/python-31210/>, scrollen Sie nach
   unten zu *Files* und laden Sie den **„macOS 64-bit universal2 installer“** herunter
   (`python-3.12.10-macos11.pkg`). Er funktioniert auf Apple-Silicon- und Intel-Macs.
2. Die `.pkg`-Datei doppelklicken und durch den Installer klicken
   (Fortfahren → Akzeptieren → Installieren, ggf. Mac-Passwort eingeben).
3. Am Ende öffnet sich ein Finder-Fenster *Python 3.12*. Dort **„Install Certificates.command“
   doppelklicken** – sonst kann es später beim Herunterladen von Paketen Zertifikatsfehler geben.
   Das Terminal-Fenster, das sich dabei öffnet, danach schließen.
4. **Prüfen:** Terminal öffnen (**Cmd + Leertaste** → `Terminal` → Enter) und eingeben:
   ```bash
   python3.12 --version
   ```
   Es sollte `Python 3.12.10` erscheinen.

### C2. Zum Übungsordner wechseln

- **Windows:** **Eingabeaufforderung** öffnen (Startmenü → `cmd`).
  Bitte nicht PowerShell verwenden – dort funktioniert Schritt C3 anders.
- **Mac:** **Terminal** öffnen.

Dann `cd` und ein Leerzeichen eintippen, den entpackten Übungsordner aus dem
Explorer/Finder **ins Fenster ziehen** und Enter drücken.

Beispiel Windows (`/d` sorgt dafür, dass auch ein Wechsel auf ein anderes Laufwerk klappt):
```
cd /d "C:\Users\maxmuster\Documents\Uebungen\uebungen-main"
```
Beispiel Mac:
```bash
cd /Users/maxmuster/Downloads/uebungen-main
```

Zur Kontrolle: `dir` (Windows) bzw. `ls` (Mac) eingeben – es sollten die Ordner `01` bis `04`
und die Datei `requirements.txt` angezeigt werden.

### C3. Umgebung anlegen und Pakete installieren (einmalig)

Die folgenden Befehle **nacheinander** eingeben, jeweils mit Enter bestätigen und warten,
bis die nächste Eingabezeile erscheint.

**Windows** (Eingabeaufforderung):
```
py -3.12 -m venv .venv
.venv\Scripts\activate
python -m pip install --upgrade pip
pip install -r requirements.txt
```

**Mac** (Terminal):
```bash
python3.12 -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip
pip install -r requirements.txt
```

Was dabei passiert:
- Zeile 1 legt im Übungsordner einen (versteckten) Ordner `.venv` mit der Umgebung an.
- Zeile 2 **aktiviert** die Umgebung: Vorne in der Eingabezeile steht jetzt **`(.venv)`**.
- Zeile 3 aktualisiert das Installationsprogramm `pip`.
- Zeile 4 installiert alle Pakete in den **getesteten Versionen** aus `requirements.txt`.
  Das dauert einige Minuten. Am Ende sollte `Successfully installed …` stehen.

> **Wichtig:** Bitte genau `requirements.txt` verwenden und keine Pakete einzeln „in der
> neuesten Version“ installieren. Mit neueren tespy-Versionen laufen Übung 03 und 04 nicht.

### C4. JupyterLab starten (jedes Mal)

**Windows** (Eingabeaufforderung):
```
cd /d "C:\Pfad\zum\Uebungsordner"
.venv\Scripts\activate
jupyter lab
```

**Mac** (Terminal):
```bash
cd /Pfad/zum/Uebungsordner
source .venv/bin/activate
jupyter lab
```

- Der Browser öffnet sich automatisch. Links im Dateibrowser **`00_START_Uebersicht.ipynb`**
  öffnen → weiter mit [Arbeiten mit JupyterLab](#arbeiten-mit-jupyterlab).
- Das Fenster mit der Eingabeaufforderung / dem Terminal **offen lassen**, solange Sie arbeiten.
- Beenden: Menü **File → Shut Down** oder im Fenster zweimal **Strg + C**.

---

## Weg D – Manuelle Installation mit Miniforge (conda)

Alternative zu Weg C für alle, die lieber mit **conda** arbeiten (wie in vielen
Lehrveranstaltungen üblich). Wir verwenden **Miniforge** – eine schlanke, kostenlose
conda-Distribution.

> **Warum nicht Anaconda?** Die Standard-Paketquellen von Anaconda sind für große
> Organisationen (wie Universitäten) lizenzpflichtig. Miniforge nutzt ausschließlich die
> freie Paketquelle *conda-forge* und funktioniert sonst genauso.
> Wer schon Anaconda oder Miniconda installiert hat, kann ab Schritt D2 mitmachen.

### D1. Miniforge installieren (einmalig)

**Windows**
1. Öffnen Sie <https://github.com/conda-forge/miniforge/releases/latest> und laden Sie
   **`Miniforge3-Windows-x86_64.exe`** herunter.
2. Installer starten → **„Just Me“** wählen → alle Voreinstellungen übernehmen → installieren.
3. Im Startmenü erscheint nun **„Miniforge Prompt“**. Diesen öffnen.

**Mac**
1. Terminal öffnen (**Cmd + Leertaste** → `Terminal` → Enter).
2. Diese beiden Befehle nacheinander einfügen und jeweils mit Enter bestätigen:
   ```bash
   curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
   bash Miniforge3-$(uname)-$(uname -m).sh
   ```
3. Lizenz mit **Enter** durchblättern, mit **`yes`** bestätigen, den Installationsort mit **Enter**
   übernehmen. Bei der Frage, ob conda automatisch initialisiert werden soll, **`yes`** eingeben.
4. **Terminal schließen und neu öffnen.** Vorne in der Zeile steht jetzt `(base)`.

### D2. Zum Übungsordner wechseln

Wie in [Schritt C2](#c2-zum-übungsordner-wechseln) – unter Windows aber im
**Miniforge Prompt** statt in der Eingabeaufforderung.

### D3. Umgebung anlegen und Pakete installieren (einmalig)

```bash
conda create -n csp python=3.12 -y
conda activate csp
pip install -r requirements.txt
```

- Vorne in der Zeile steht jetzt `(csp)` statt `(base)`.
- Die Installation dauert einige Minuten.

### D4. JupyterLab starten (jedes Mal)

Im Miniforge Prompt (Windows) bzw. Terminal (Mac) in den Übungsordner wechseln (D2), dann:
```bash
conda activate csp
jupyter lab
```

---

## VS Code statt JupyterLab (für Weg C und D)

1. [VS Code](https://code.visualstudio.com/) installieren und dort die Erweiterungen
   **Python** und **Jupyter** (beide von Microsoft) installieren.
2. In VS Code **Datei → Ordner öffnen…** → den Übungsordner wählen.
3. Ein Notebook öffnen, oben rechts auf **„Kernel auswählen“** klicken →
   **Python-Umgebungen** → bei Weg C **`.venv`**, bei Weg D **`csp`** auswählen.

---

## Probleme bei der manuellen Installation

| Fehlermeldung | Ursache und Lösung |
|---|---|
| `py` bzw. `python3.12` wird nicht erkannt | Python ist nicht (richtig) installiert. Schritt C1 wiederholen; unter Windows auf den Haken **„Add python.exe to PATH“** achten. Danach das Fenster neu öffnen. |
| Windows: Statt Python öffnet sich der **Microsoft Store** | Den Befehl `py -3.12` verwenden (nicht `python`). Optional: Einstellungen → Apps → Erweiterte App-Einstellungen → **App-Ausführungsaliase** → „python.exe“ und „python3.exe“ ausschalten. |
| `.venv\Scripts\activate` – „Ausführung von Skripts ist deaktiviert“ | Sie sind in **PowerShell**. Bitte die **Eingabeaufforderung** (`cmd`) verwenden. |
| `conda` wird nicht erkannt | Windows: den **Miniforge Prompt** benutzen, nicht die normale Eingabeaufforderung. Mac: Terminal neu öffnen. |
| `jupyter` wird nicht erkannt / `ModuleNotFoundError: No module named 'tespy'` | Die Umgebung ist nicht aktiviert. Weg C: Zeile 2 aus C3 ausführen (vorne muss `(.venv)` stehen). Weg D: `conda activate csp`. In VS Code den richtigen Kernel auswählen. |
| `cannot import name 'Bus' from 'tespy.connections'` | Falsche tespy-Version. In der aktivierten Umgebung: `pip install tespy==0.9.16.post3` |
| `No such file or directory: requirements.txt` | Nicht im Übungsordner. Schritt C2 wiederholen. |
| Mac: `SSL: CERTIFICATE_VERIFY_FAILED` | „Install Certificates.command“ aus C1 (Mac, Schritt 3) ausführen. Zu finden unter Programme → Python 3.12. |
| Fehler beim Bauen eines Pakets („Failed building wheel“, „Microsoft Visual C++ … is required“) | Falsche Python-Version (z. B. 3.13 oder neuer). Python 3.12 installieren, den Ordner `.venv` löschen und C3 wiederholen. |
| Irgendetwas ist „verkonfiguriert“ | Weg C: Den Ordner `.venv` im Übungsordner löschen und C3 wiederholen. Weg D: `conda deactivate`, `conda env remove -n csp`, dann D3 wiederholen. |
