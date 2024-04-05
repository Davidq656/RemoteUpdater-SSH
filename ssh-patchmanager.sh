#!/bin/bash

# Definiere Pfad für die Log-Dateien und SSH-Ziele Datei
LOG_DIR="./logs"
SSH_TARGETS_FILE="ssh_targets.txt"
OUTPUT_DIR_BASE="./command_outputs"

# Vordefinierte Befehle
COMMANDS=("sudo apt update" "Benutzerdefinierter Befehl 2" "Benutzerdefinierter Befehl 3")

# Stelle sicher, dass das Verzeichnis für die Log-Dateien existiert
mkdir -p $LOG_DIR
mkdir -p $OUTPUT_DIR_BASE

manage_ssh_targets() {
    echo "Manage SSH Targets:"
    echo "1. Add a new SSH target"
    echo "2. Edit an existing SSH target"
    echo "3. Delete an existing SSH target"
    read -p "Choose an option (1-3): " manage_option

    case $manage_option in
        1)
            echo "Enter an alias for the new SSH target:"
            read -r alias
            echo "Enter the username for the SSH connection:"
            read -r user
            echo "Enter the IP address or DNS name for $alias:"
            read -r address
            echo "$alias $user $address" >> "$SSH_TARGETS_FILE"
            echo "SSH target $alias has been added."
            ;;
        2)
            echo "Available SSH targets:"
            IFS=$'\n' read -d '' -r -a lines < "$SSH_TARGETS_FILE"
            for i in "${!lines[@]}"; do
                echo "$((i+1)). ${lines[i]}"
            done
            echo "Enter the number of the target to edit:"
            read -r num
            target="${lines[$((num-1))]}"
            echo "Current data: $target"
            echo "Enter a new alias for the SSH target (current: ${target%% *}):"
            read -r new_alias
            echo "Enter a new username for the SSH connection (current: ${target%% * }):"
            read -r new_user
            echo "Enter a new IP address or DNS name for $new_alias (current: ${target##* }):"
            read -r new_address
            lines[$((num-1))]="$new_alias $new_user $new_address"
            > "$SSH_TARGETS_FILE"
            for line in "${lines[@]}"; do
                echo "$line" >> "$SSH_TARGETS_FILE"
            done
            echo "SSH target has been updated."
            ;;
        3)
            echo "Available SSH targets:"
            IFS=$'\n' read -d '' -r -a lines < "$SSH_TARGETS_FILE"
            for i in "${!lines[@]}"; do
                echo "$((i+1)). ${lines[i]}"
            done
            echo "Enter the number of the target to delete:"
            read -r del_num
            unset lines[$((del_num-1))]
            > "$SSH_TARGETS_FILE"
            for line in "${lines[@]}"; do
                [[ -n $line ]] && echo "$line" >> "$SSH_TARGETS_FILE"
            done
            echo "SSH target has been deleted."
            ;;
        *)
            echo "Invalid option."
            ;;
    esac
}


connect_to_server() {
    if [ ! -s $SSH_TARGETS_FILE ]; then
        echo "Keine SSH-Ziele gefunden. Bitte zuerst ein Ziel hinzufügen."
        return
    fi

    echo "Verfügbare SSH-Ziele:"
    IFS=$'\n' read -d '' -r -a lines < $SSH_TARGETS_FILE
    for i in "${!lines[@]}"; do
        echo "$((i+1)). ${lines[i]%% *}"
    done
    echo "Nummer des Ziels eingeben, zu dem verbunden werden soll:"
    read num
    target="${lines[$((num-1))]}"
    alias="${target%% *}"
    user="${target#* }"
    user="${user%% *}"
    address="${target##* }"

    output_dir="$OUTPUT_DIR_BASE/$alias"
    mkdir -p "$output_dir"

    while true; do
        echo "Verbindung zu $alias ($address) wird hergestellt..."
        echo "Wählen Sie eine Option:"
        echo "1. Vordefinierten Befehl ausführen"
        echo "2. Eigenen Befehl eingeben"
        echo "3. Verbindung beenden"
        read option

        if [ "$option" == "1" ]; then
            echo "Wählen Sie einen vordefinierten Befehl zur Ausführung:"
            for i in "${!COMMANDS[@]}"; do
                echo "$((i+1)). ${COMMANDS[i]}"
            done
            read cmd_num
            selected_cmd="${COMMANDS[$((cmd_num-1))]}"
        elif [ "$option" == "2" ]; then
            echo "Geben Sie Ihren Befehl ein:"
            read selected_cmd
        elif [ "$option" == "3" ]; then
            echo "Verbindung wird beendet..."
            break
        else
            echo "Ungültige Option. Bitte versuchen Sie es erneut."
            continue
        fi

        if [[ -z "$selected_cmd" ]]; then
            echo "Kein gültiger Befehl ausgewählt. Bitte versuchen Sie es erneut."
            continue
        fi

        output_file="$output_dir/command_output_$(date +%Y-%m-%d_%H-%M-%S).txt"
        ssh -t ${user}@${address} "$selected_cmd" | tee "$output_file" 2>&1
        exit_code=${PIPESTATUS[0]}
        log_file="$LOG_DIR/${alias}_log.csv"
        if [ ! -f $log_file ]; then
            echo "timestamp,alias,user,address,local_user,command,output_file,exit_code" > $log_file
        fi
        echo "$(date),$alias,$user,$address,$(whoami),\"$selected_cmd\",\"$output_file\",$exit_code" >> $log_file
    done
}

while true; do
    echo "Hauptmenü:"
    echo "1. Mit Server verbinden"
    echo "2. SSH-Ziele verwalten (hinzufügen/bearbeiten)"
    echo "3. Beenden"
    read -p "Option wählen: " option
    case $option in
        1) connect_to_server ;;
        2) manage_ssh_targets ;;
        3) break ;;
        *) echo "Ungültige Option." ;;
    esac
done
