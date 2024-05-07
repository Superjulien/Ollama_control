#!/bin/bash

# Ollama control for bash
# by superjulien
# > https://github.com/Superjulien
# > https://framagit.org/Superjulien
# V0.3

logo() {
    echo ""    
    echo "##################"
    echo "# Ollama Control #"
    echo "# for bash       #"
    echo "#          v0.03 #"
    echo "##################"
    echo ""
}

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
        echo -e "$result"
        result=""
    fi
    read -p "> " choice
    case $choice in
        1)
            if sudo systemctl is-active --quiet ollama; then
                result="[!] Error: ollama is already active."
            else
                result="[#] Starting ollama..."
                sudo systemctl start ollama
            fi
            ;;
        2)
            if sudo systemctl is-active --quiet ollama; then
                result="[!] Error: ollama is active."
            else
                result="[#] Updating and installing ollama..."
                sudo curl https://ollama.ai/install.sh | sh
            fi
            ;;
        3)
            if sudo systemctl is-active --quiet ollama; then
                result="[#] List of installed models:"
                result+="\n"
                result+="$(sudo ollama list)"
            else
                result="[!] Error: ollama is stopped."
            fi
            ;;
        4)
            if sudo systemctl is-active --quiet ollama; then
                result="[#] Stopping ollama..."
                sudo systemctl stop ollama
            else
                result="[!] Error: ollama is already stopped."
            fi
            ;;
        5)
            while true; do
                if sudo systemctl is-active --quiet ollama; then
                    clear
                    logo
                    echo "[#>] List of installed models:"
                    models=($(ollama list | awk 'NR > 1 {split($1, arr, ":"); print arr[1]}'))
                    if [ ${#models[@]} -eq 0 ]; then
                        echo ""
                        echo "[!] No models installed."
                        sleep 2
                        break

                    else
                        for ((i=0; i<${#models[@]}; i++)); do
                            echo "$((i+1)): ${models[i]}"
                        done
                        echo ""
                        echo "Select a model (0 to quit):"
                        echo ""
                        read -p "> " model_choice
                        if [[ "$model_choice" =~ ^[0-9]+$ && "$model_choice" -ge 0 && "$model_choice" -le ${#models[@]} ]]; then
                            if [ "$model_choice" -eq 0 ]; then
                                echo ""
                                echo "[#] Return to main menu."
                                sleep 1
                                break
                            else
                                selected_model=${models[model_choice-1]}
                                clear
                                echo "[#] Launching ollama run with model $selected_model..."
                                sudo ollama run "$selected_model"
                                break
                            fi
                        else
                            echo ""
                            echo "[!] Invalid option. Please select a valid number."
                            sleep 1
                        fi
                    fi
                else
                    result="[!] Error: ollama is stopped."
                    break
                fi
            done
            ;;
        6)
            if sudo systemctl is-active --quiet ollama; then
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