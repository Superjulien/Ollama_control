# Ollama Control

[![Version bash](https://img.shields.io/badge/Version.bash-0.03-blue.svg)](https://github.com/Superjulien/Ollama_control) [![Version sh](https://img.shields.io/badge/Version.sh-0.06-blue.svg)](https://github.com/Superjulien/Ollama_control) [![License](https://img.shields.io/badge/License-GNU_GPLv3-blue.svg)](https://choosealicense.com/licenses/gpl-3.0/) [![Python](https://img.shields.io/badge/Python_3-14354C?&logo=python&logoColor=white.svg)](https://www.python.org/)

## Description

These scripts are designed to provide a user-friendly command-line interface for controlling Ollama servers. This repository contains two scripts for controlling Ollama servers: one written in Bash (`control_ollama_forbash`) and the other written in sh (`control_ollama_forsh`). These scripts provide common tasks such as starting, stopping, updating, and launching specific models with Ollama servers, thus simplifying system management.

## Features

- **Start Ollama Server:** This option starts the Ollama service if it is not already running. The script first checks if the service is already active before attempting to start it.
  
- **Stop Ollama Server:** Stopping the Ollama service is done by first checking if the service is currently running. If it is, the script stops the service; otherwise, it reports that the service is already stopped.

- **Update and Install Ollama:** This feature updates and installs the latest version of Ollama by downloading the official installation script from `https://ollama.ai/install.sh` and executing it via `sh`. However, this operation can only be performed when the Ollama service is stopped to avoid disruption during the update.

- **List Installed Models:** When the Ollama service is active, the script displays a list of models currently installed on the server. It uses the `ollama list` command to obtain this information.

- **Launch Specific Models:** This feature allows the user to select an installed model and launch it with the Ollama server. The script retrieves the list of installed models, then prompts the user to choose a specific model. Once selected, the model is launched with the `ollama run` command.

- **Check Ollama Server Status:** The script can check whether the Ollama service is currently active or stopped using the `systemctl is-active` command.

## Prerequisites

- **Operating System:** The script is designed to work on Linux systems.
- **Python 3:** Ensure Python 3 is installed on your system as well.
- **Ollama Installed:** Make sure you have installed and configured the Ollama server on your system before using this script.

## Installation

1. **Clone the Repository:**

    ```bash
    git clone https://github.com/Superjulien/Ollama_control.git
    ```

2. **Navigate to the Project Directory:**

    ```bash
    cd Ollama_control
    ```

3. **Give Execution Rights to the Script:**

    ```bash
    chmod +x control_ollama_forsh.sh
    ```
    or
    ```bash
    chmod +x control_ollama_forbash.sh
    ```

## Usage

- **Run the Script:**

    ```bash
    sudo sh control_ollama_forsh.sh
    ```
    or 
    ```bash
    sudo bash control_ollama_forbash.sh
    ```
    
- **Follow the on-screen instructions to choose from the available options.**

## Mechanisms

- **Main Loop:** The script uses a `while true` loop to display the menu and wait for user input until they choose to quit.

- **Option Handling:** The script uses a `case` structure to handle the different options selected by the user.

- **Service Status Check:** Before performing certain actions, such as starting or stopping the Ollama service, the script first checks whether the service is already active or stopped.

- **Interaction with Ollama:** For operations such as listing installed models and launching specific models, the script uses appropriate Ollama commands, such as `ollama list` and `ollama run`.

## Sponsoring

This software is provided to you free of charge, with the hope that if you find it valuable, you'll consider making a donation to a charitable organization of your choice :

- SPA (Society for the Protection of Animals): The SPA is one of the oldest and most recognized organizations in France for the protection of domestic animals. It provides shelters, veterinary care, and works towards responsible adoption.

  [![SPA](https://img.shields.io/badge/Sponsoring-SPA-red.svg)](https://www.la-spa.fr/)

- French Popular Aid: This organization aims to fight against poverty and exclusion by providing food aid, clothing, and organizing recreational activities for disadvantaged individuals.

  [![SPF](https://img.shields.io/badge/Sponsoring-Secours%20Populaire%20Français-red.svg)](https://www.secourspopulaire.fr)

- Doctors Without Borders (MSF): MSF provides emergency medical assistance to populations in danger around the world, particularly in conflict zones and humanitarian crises.

  [![MSF](https://img.shields.io/badge/Sponsoring-Médecins%20Sans%20Frontières-red.svg)](https://www.msf.fr)

- Restaurants of the Heart : Restaurants of the Heart provides meals, emergency accommodation, and social services to the underprivileged.

  [![RDC](https://img.shields.io/badge/Sponsoring-Restaurants%20du%20Cœur-red.svg)](https://www.restosducoeur.org)

- French Red Cross: The Red Cross offers humanitarian aid, emergency relief, first aid training, as well as social and medical activities for vulnerable individuals.

   [![CRF](https://img.shields.io/badge/Sponsoring-Croix%20Rouge%20Française-red.svg)](https://www.croix-rouge.fr)

Every small gesture matters and contributes to making a real difference.

## License

Ollama Control is open-source software released under the [GNU GPLv3 License](https://choosealicense.com/licenses/gpl-3.0/). This license allows users of this software to use it, modify it, distribute it, and share it freely while preserving transparency and collaboration.

## Support
For support email : 

[![Gmail: superjulien](https://img.shields.io/badge/Gmail-Contact%20Me-purple.svg)](mailto:contact.superjulien@gmail.com) [![Tutanota: superjulien](https://img.shields.io/badge/Tutanota-Contact%20Me-green.svg)](mailto:contacts.superjulien@tutanota.com)
