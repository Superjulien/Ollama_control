#!/bin/sh

# Ollama control for sh
# by superjulien
# > https://github.com/Superjulien
# > https://framagit.org/Superjulien
# V0.6

logo() {
    printf "\n#################\n# Ollama Control #\n# for sh         #\n#          v0.06 #\n#################\n\n"
}

if [ "$(id -u)" -ne 0 ]; then
    echo "Please run this script with sudo."
    exit 1
fi

while true; do
    clear
    logo
    echo "Choose an option:"
    echo ""
    echo "1: Start ollama server"
    echo "2: Update and install ollama"
    echo "3: List installed models"
    echo "4: Stop ollama"
    echo "5: Launch ollama"
    echo "6: Check the status of ollama"
    echo "7: Quit"
    echo ""
    if [ ! -z "$result" ]; then
        printf "%s\n" "$result"
        result=""
    fi
    read -p "> " choice
    case $choice in
        1)
            if systemctl is-active --quiet ollama; then
                result="[!] Error: ollama is already active."
            else
                result="[#] Starting ollama..."
                systemctl start ollama
            fi
            ;;
        2)
            if systemctl is-active --quiet ollama; then
                result="[!] Error: ollama is active."
            else
                result="[#] Updating and installing ollama..."
                curl https://ollama.ai/install.sh | sh
            fi
            ;;
        3)
            if systemctl is-active --quiet ollama; then
                result=$(printf "[#] List of installed models:\n%s" "$(ollama list)")
            else
                result="[!] Error: ollama is stopped."
            fi
            ;;
        4)
            if systemctl is-active --quiet ollama; then
                result="[#] Stopping ollama..."
                systemctl stop ollama
            else
                result="[!] Error: ollama is already stopped."
            fi
            ;;
        5)
            while true; do
                if systemctl is-active --quiet ollama; then
                    clear
                    logo
                    echo "[#>] List of installed models:"
                    models=$(ollama list | awk 'NR > 1 {split($1, arr, ":"); print arr[1]}')
                    if [ -z "$models" ]; then
                        echo ""
                        echo "[!] No models installed."
                        sleep 2
                        break
                    else
                        echo "$models" | awk '{print NR": "$1}'
                        echo ""
                        echo "Select a model (0 to quit):"
                        echo ""
                        read -p "> " model_choice
                        if [ -z "$model_choice" ]; then
                            echo ""
                            echo "[!] Input cannot be empty. Please enter a valid number."
                            sleep 2
                            continue
                        elif ! echo "$model_choice" | grep -q '^[0-9]*$'; then
                            echo ""
                            echo "[!] Invalid input. Please enter a valid number."
                            sleep 2
                            continue
                        elif [ "$model_choice" -eq 0 ]; then
                            echo ""
                            echo "[#] Return to main menu."
                            sleep 1
                            break
                        elif [ "$model_choice" -gt 0 ] && [ "$model_choice" -le "$(echo "$models" | wc -l)" ]; then
                            selected_model=$(echo "$models" | sed -n "${model_choice}p")
                            clear
                            echo "[#] Launching ollama run with model $selected_model..."
                            ollama run "$selected_model"
                            break
                        else
                            echo ""
                            echo "[!] Invalid option. Please select a valid number."
                            sleep 2
                        fi
                    fi
                else
                    result="[!] Error: ollama is stopped."
                    break
                fi
            done
            ;;
        6)
            if systemctl is-active --quiet ollama; then
                result="[#] Ollama is active."
            else
                result="[#] Ollama is stopped."
            fi
            ;;
        7)
            result="[#] Exiting the script."
            exit 0
            ;;
        *)
            result="[!] Invalid option. Please select a valid number."
            ;;
    esac    
done
