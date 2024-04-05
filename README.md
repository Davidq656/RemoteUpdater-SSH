ssh-patchmanager README

Der ssh-patchmanager ist ein Bash-Skript zur Vereinfachung der Verwaltung und Ausführung von SSH-Befehlen auf entfernten Servern. Es bietet eine benutzerfreundliche Schnittstelle für das Hinzufügen, Bearbeiten und Herstellen von Verbindungen zu verschiedenen SSH-Zielen, was es besonders nützlich macht für Administratoren und Techniker, die regelmäßig mit mehreren Servern interagieren.
Hauptfunktionen

    Hinzufügen von SSH-Zielen: Ermöglicht das Speichern neuer SSH-Ziele mit Alias, Benutzername und Adresse.
    Bearbeiten von SSH-Zielen: Ermöglicht das Aktualisieren der Details gespeicherter SSH-Ziele, einschließlich Alias, Benutzername und Adresse.
    Verbindung zu SSH-Zielen: Ermöglicht das Ausführen von Befehlen auf entfernten Servern über eine SSH-Verbindung basierend auf ausgewählten Zielen.
    Erweitertes Logging: Protokolliert die Ausführung von Befehlen, einschließlich Details wie Zeitstempel, Zielalias, Benutzer, Adresse, ausgeführtem Befehl und Exit-Code.

Verwendung
1. SSH-Ziele hinzufügen

Um ein neues SSH-Ziel zum Skript hinzuzufügen, wählen Sie die Option "Neues SSH-Ziel hinzufügen" aus dem Hauptmenü. Geben Sie dann den Alias, den Benutzernamen für die SSH-Verbindung und die Adresse (IP oder DNS-Name) des Zielservers ein. Das Ziel wird zur Liste der SSH-Ziele hinzugefügt.
2. SSH-Ziele bearbeiten

Wählen Sie "Bestehendes SSH-Ziel bearbeiten", um die Details eines bereits gespeicherten SSH-Ziels zu ändern. Sie können den Alias, Benutzernamen und die Adresse des gewählten Ziels aktualisieren.
3. Verbindung zu SSH-Zielen

Um eine Verbindung zu einem SSH-Ziel herzustellen, wählen Sie "Mit Server verbinden" und anschließend das gewünschte Ziel aus der Liste. Nach der Eingabe des auszuführenden Befehls wird die SSH-Verbindung hergestellt, der Befehl ausgeführt und die Ausgabe sowohl auf dem Bildschirm angezeigt als auch in einer Datei protokolliert.
4. Logging

Das Skript protokolliert jede Befehlsausführung mit Details wie Zeitstempel, Zielalias, Benutzername, Adresse, ausgeführtem Befehl, Pfad zur Ausgabedatei und Exit-Code. Die Logs werden im Verzeichnis ./logs gespeichert, organisiert nach dem Alias des Ziels.
Setup

    Überprüfen Sie, ob Bash auf Ihrem System installiert ist.
    Platzieren Sie das Skript in einem gewünschten Verzeichnis.
    Vergeben Sie Ausführungsrechte für das Skript: chmod +x ssh-patchmanager.sh.
    Starten Sie das Skript mit: ./ssh-patchmanager.sh.

Sicherheitshinweise

    Bevorzugen Sie SSH-Schlüssel für eine sichere und passwortfreie Authentifizierung.
    Beschränken Sie die Zugriffsrechte auf das Skript und die Konfigurationsdateien (ssh_targets.txt, Log-Dateien), um die Sicherheit Ihrer Daten zu gewährleisten.

Fazit

ssh-patchmanager erleichtert die Verwaltung von SSH-Verbindungen durch eine intuitive Schnittstelle und automatisiertes Logging. Es ist ein unverzichtbares Werkzeug für jeden, der regelmäßig Aufgaben auf mehreren Servern über SSH ausführt.
