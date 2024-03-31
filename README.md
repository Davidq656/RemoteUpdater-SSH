RemoteUpdater-SSH README

Der RemoteUpdater-SSH ist ein Bash-Skript, das die Verwaltung und Ausführung von SSH-Befehlen auf entfernten Servern vereinfacht. Es ermöglicht das Hinzufügen, Bearbeiten und Verbinden mit verschiedenen SSH-Zielen unter Verwendung von Aliasnamen, um die Effizienz und Benutzerfreundlichkeit bei der Arbeit mit mehreren Servern zu verbessern.
Hauptfunktionen

    SSH-Ziele hinzufügen: Benutzer können neue SSH-Ziele mit Alias, Benutzername und Adresse speichern.
    SSH-Ziele bearbeiten: Bereits gespeicherte SSH-Ziele können bearbeitet werden, um Alias, Benutzername oder Adresse zu aktualisieren.
    Mit SSH-Zielen verbinden: Benutzer können eine interaktive SSH-Verbindung zu einem ausgewählten Ziel aufbauen und Befehle ausführen.
    Logging: Das Skript protokolliert die Ausführung von Befehlen, einschließlich Zeitstempel, Zielalias, Benutzer, Adresse, ausgeführtem Befehl und Exit-Code.

Verwendung
1. SSH-Ziele hinzufügen

Um ein neues SSH-Ziel hinzuzufügen, wählen Sie die Option "Neues SSH-Ziel hinzufügen" aus dem Hauptmenü. Geben Sie den Aliasnamen, den Benutzernamen für die SSH-Verbindung und die IP-Adresse oder den DNS-Namen des Zielservers ein. Das Ziel wird dann zur Liste der verfügbaren SSH-Ziele hinzugefügt.
2. SSH-Ziele bearbeiten

Wählen Sie "Bestehendes SSH-Ziel bearbeiten", um die Details eines gespeicherten SSH-Ziels zu ändern. Nach Auswahl des Ziels können Sie den Alias, den Benutzernamen und die Adresse aktualisieren.
3. Mit SSH-Zielen verbinden

Um eine Verbindung zu einem SSH-Ziel herzustellen, wählen Sie "Mit Server verbinden" und dann das gewünschte Ziel aus der Liste der gespeicherten Ziele. Nach Eingabe des Befehls wird eine SSH-Verbindung zum Ziel aufgebaut, der Befehl ausgeführt und die Ausgabe sowohl interaktiv angezeigt als auch in einer Log-Datei gespeichert.
4. Logging

Jede Befehlsausführung wird mit einem Zeitstempel, dem Zielalias, dem Benutzernamen, der Adresse, dem ausgeführten Befehl, dem Pfad zur Ausgabedatei des Befehls und dem Exit-Code protokolliert. Log-Dateien werden im ./logs Verzeichnis gespeichert und sind nach dem Alias des Ziels benannt.
Setup

    Stellen Sie sicher, dass Bash auf Ihrem System installiert und ausführbar ist.
    Speichern Sie das Skript in einem Verzeichnis Ihrer Wahl.
    Setzen Sie die Ausführungsberechtigung für das Skript mit dem Befehl chmod +x ProxSSH-Manager.sh.
    Starten Sie das Skript mit ./ProxSSH-Manager.sh.

Sicherheitshinweise

    Verwenden Sie, wo möglich, SSH-Schlüssel anstelle von Passwörtern für eine sichere Authentifizierung.
    Stellen Sie sicher, dass die Zugriffsrechte auf das Skript und die Konfigurationsdateien (ssh_targets.txt, Log-Dateien) entsprechend eingeschränkt sind, um die Sicherheit zu gewährleisten.

Fazit

Der RemoteUpdater-SSH verbessert die Verwaltung von SSH-Verbindungen zu mehreren Servern durch eine einfache und intuitive Benutzeroberfläche. Mit Funktionen zum Hinzufügen, Bearbeiten und Verbinden mit SSH-Zielen sowie zum Protokollieren von Befehlsausführungen hilft dieses Skript, den Arbeitsaufwand bei der Fernverwaltung von Servern zu reduzieren.
