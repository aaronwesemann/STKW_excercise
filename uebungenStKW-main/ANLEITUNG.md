# Anleitung: Python-Übungen starten

Es gibt drei Wege. **Weg A (Windows) oder Weg B (Mac) ist der einfachste:** Sie müssen dafür
nichts selbst installieren. Weg C (manuelle Installation) ist für alle, die Python dauerhaft
auf ihrem Rechner haben möchten.

| Ihr Gerät | Empfohlener Weg |
|---|---|
| Windows-PC / -Laptop | [Weg A – Windows: Doppelklick](#weg-a--windows-doppelklick) |
| Mac (Apple Silicon oder Intel) | [Weg B – Mac: ein Befehl im Terminal](#weg-b--mac-ein-befehl-im-terminal) |
| Linux | Weg B funktioniert genauso |
| iPad / Tablet | leider nicht möglich – bitte bei der Übungsleitung melden |

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

## Weg C – Manuelle Installation (Windows und Mac)

Für alle, die Python dauerhaft installieren oder mit VS Code arbeiten möchten.
Wir verwenden **Miniforge** – eine schlanke, kostenlose Python-Distribution.

> **Warum nicht Anaconda?** Die Standard-Paketquellen von Anaconda sind für große
> Organisationen (wie Universitäten) lizenzpflichtig. Miniforge nutzt ausschließlich die
> freie Paketquelle *conda-forge* und funktioniert sonst genauso.
> Wer schon Anaconda oder Miniconda installiert hat, kann ab Schritt C2 mitmachen.

### C1. Miniforge installieren (einmalig)

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

### C2. Zum Übungsordner wechseln

Im **Miniforge Prompt** (Windows) bzw. **Terminal** (Mac) `cd` und ein Leerzeichen eintippen,
dann den entpackten Übungsordner aus dem Explorer/Finder ins Fenster ziehen und Enter drücken:

Beispiel Windows:
```
cd "C:\Users\maxmuster\Documents\Uebungen\uebungen-main"
```
Beispiel Mac:
```bash
cd /Users/maxmuster/Downloads/uebungen-main
```

Windows: Liegt der Ordner auf einem anderen Laufwerk (z. B. `D:`), zusätzlich `D:` eintippen und Enter.

### C3. Eigene Umgebung anlegen und Pakete installieren (einmalig)

```bash
conda create -n csp python=3.11 -y
conda activate csp
pip install -r requirements.txt
```

- Vorne in der Zeile steht jetzt `(csp)` statt `(base)`.
- Die Installation dauert einige Minuten.
- **Wichtig:** Bitte genau `requirements.txt` verwenden. Dort sind die getesteten Versionen
  festgelegt – mit neueren tespy-Versionen laufen Übung 03 und 04 nicht.

### C4. JupyterLab starten (jedes Mal)

```bash
conda activate csp
jupyter lab
```

- Vorher wie in C2 in den Übungsordner wechseln.
- Der Browser öffnet sich automatisch. Links im Dateibrowser **`00_START_Uebersicht.ipynb`**
  öffnen → weiter mit [Arbeiten mit JupyterLab](#arbeiten-mit-jupyterlab).
- Beenden: Menü **File → Shut Down** oder im Fenster zweimal **Strg + C**.

### Alternative: VS Code statt JupyterLab

1. [VS Code](https://code.visualstudio.com/) installieren und dort die Erweiterungen
   **Python** und **Jupyter** (beide von Microsoft) installieren.
2. In VS Code **Datei → Ordner öffnen…** → den Übungsordner wählen.
3. Ein Notebook öffnen, oben rechts auf **„Kernel auswählen“** klicken →
   **Python-Umgebungen** → **`csp`** auswählen.

### Probleme bei der manuellen Installation

| Fehlermeldung | Ursache und Lösung |
|---|---|
| `conda` wird nicht erkannt | Windows: den **Miniforge Prompt** benutzen, nicht die normale Eingabeaufforderung. Mac: Terminal neu öffnen. |
| `ModuleNotFoundError: No module named 'tespy'` (o. ä.) | Falsche Umgebung. `conda activate csp` vergessen – bzw. in VS Code den Kernel `csp` auswählen. |
| `cannot import name 'Bus' from 'tespy.connections'` | Falsche tespy-Version. In der Umgebung `csp`: `pip install tespy==0.9.16.post3` |
| `No such file or directory: requirements.txt` | Nicht im Übungsordner. Schritt C2 wiederholen. |
| Fehler beim Bauen eines Pakets („Failed building wheel“) | Falsche Python-Version. Umgebung löschen und neu anlegen: `conda deactivate`, `conda env remove -n csp`, dann C3 wiederholen. |
