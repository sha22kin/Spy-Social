#!/bin/bash

# Colors
G='\033[0;32m'; R='\033[0;31m'; Y='\033[1;33m'; B='\033[0;34m'; C='\033[0;36m'; P='\033[0;35m'; W='\033[1;37m'; NC='\033[0m'

# --- DYNAMIC STAGE ANIMATION ---
run_stage() {
    local task=$1
    local duration=$2
    echo -e "${B}[*] $task...${NC}"
    local start_time=$(date +%s)
    while [ $(($(date +%s) - start_time)) -lt $duration ]; do
        local current=$(($(date +%s) - start_time))
        local percent=$((current * 100 / duration))
        echo -ne "${G}PROCESSED: [${percent}%] 0x$(head /dev/urandom | tr -dc 'a-f0-9' | head -c 6)...\r"
        sleep 0.5
    done
    echo -e "${G}PROCESSED: [100%] [SUCCESS]          ${NC}"
    echo -e "\a"
}

# --- BIG TEXT HEADER FUNCTION ---
header() {
    clear
    echo -e "${G}############################################################"
    echo -e "${G}   _____ ______     __  _____  ____   _____ _____          _"
    echo -e "${G}  / ____|  __ \ \   / / / ____|/ __ \ / ____|_   _|   /\   | |"
    echo -e "${G} | (___ | |__) \ \_/ / | (___ | |  | | |      | |    /  \  | |"
    echo -e "${G}  \___ \|  ___/ \   /   \___ \| |  | | |      | |   / /\ \ | |"
    echo -e "${G}  ____) | |      | |    ____) | |__| | |____ _| |_ / ____ \| |____"
    echo -e "${G} |_____/|_|      |_|   |_____/ \____/ \_____|_____/_/    \_\______|"
    echo -e ""
    echo -e "${R}             [ CODE NAME: CRACK SMITH ]"
    echo -e "${W}         [ OWNER: SHAKIN AL HASSAN EMON ]"
    echo -e "${G}############################################################${NC}"
}

# --- LOGIN ---
clear
echo -e "${R}--- ENCRYPTED KERNEL LOGIN ---${NC}"
echo -en "${Y}ENTER SYSTEM KEY: ${NC}"
read -s password
[[ "$password" != "emon123" ]] && { echo -e "${R}DENIED${NC}"; exit; }

while true; do
header
echo -e "${Y}[1] Facebook Hack       [2] Instagram Hack"
echo -e "[3] TikTok Hijacker     [4] WhatsApp DB Mirror"
echo -e "[5] WiFi WPA3 Cracker   [6] Global GPS Tracker"
echo -e "[7] Email SMTP Cracker  [8] Server DDoS Shell"
echo -e "[9] Cloud Storage Bypass [10] Network Sniffer"
echo -e "[00] Exit Session"
echo -e "---------------------------------------${NC}"
read -p "root@cracksmith:~# " opt

case $opt in
    1|2) # FB / IG
        type="Facebook"; [[ "$opt" == "2" ]] && type="Instagram"
        read -p "Enter $type ID: " target
        run_stage "Infecting $type Graph API" 45
        for i in {1..40}; do echo -e "${G}EXTRACTING: 0x$(head /dev/urandom | tr -dc 'a-f0-9' | head -c 12)${NC}"; sleep 0.2; done
        run_stage "Bypassing 2FA Verification" 50
        echo -e "${G}[+] $type PASS: hack_$(shuf -i 1000-9999 -n 1)${NC}"; read -p "Press Enter..." ;;

    3) # TikTok
        read -p "TikTok Username: " user; run_stage "Connecting to ByteDance" 40
        for i in {1..10}; do echo -e "${P}STREAMING_METADATA_0$i... [OK]${NC}"; sleep 3; done
        run_stage "Injecting Remote Payload" 45
        echo -e "${G}[+] Token Captured: $(head /dev/urandom | tr -dc 'A-Z0-9' | head -c 16)${NC}"; read -p "Press Enter..." ;;

    4) # WhatsApp
        read -p "Number: " num; run_stage "Bypassing E2EE Key" 50
        for i in {1..12}; do echo -e "${Y}Cloning Chat Fragment #$i...${NC}"; sleep 3; done
        run_stage "Finalizing DB Mirror" 45; read -p "Enter..." ;;

    5) # WiFi
        read -p "SSID: " ssid; run_stage "Capturing Handshake" 40
        for i in {1..80}; do echo -ne "\r${P}DICT_ATTACK: $(head /dev/urandom | tr -dc 'a-z' | head -c 10)${NC}"; sleep 0.1; done
        run_stage "Verifying Key Integrity" 45; read -p "Enter..." ;;

    6) # GPS
        read -p "IP: " ip; run_stage "Establishing Satellite Link" 35
        for i in {1..12}; do echo -e "${B}SATELLITE COORDINATE: $(shuf -i 23-25 -n 1).$(shuf -i 100-999 -n 1)${NC}"; sleep 3; done
        run_stage "Triangulating Target" 40; read -p "Enter..." ;;

    7) # Email
        read -p "Target Email: " email; run_stage "Checking SMTP Security" 40
        for i in {1..60}; do echo -ne "\r${Y}BRUTE_FORCE: $(head /dev/urandom | tr -dc 'a-z0-9' | head -c 8)${NC}"; sleep 0.1; done
        run_stage "Cracking Password Hash" 50; read -p "Enter..." ;;

    8) # DDoS
        read -p "Target URL: " url; run_stage "Connecting to Botnet Nodes" 40
        for i in {1..40}; do echo -e "${R}ATTACKING $url --> [BUFFER_OVERFLOW]${NC}"; sleep 0.8; done
        echo -e "${G}[+] Server Down: 503 Service Unavailable${NC}"; read -p "Enter..." ;;

    9) # Cloud
        read -p "Cloud User: " cloud; run_stage "Scanning GoogleDrive/iCloud" 40
        for i in {1..15}; do echo -e "${C}EXTRACTING: file_$(shuf -i 100-999 -n 1).zip [COMPLETE]${NC}"; sleep 3; done
        run_stage "Reassembling Data Blocks" 45; read -p "Enter..." ;;

    10) # Sniffer
        echo -e "${G}[*] Opening Network Socket...${NC}"
        start_net=$(date +%s)
        while [ $(($(date +%s) - start_net)) -lt 70 ]; do
            echo -e "${G}PACKET: 192.168.1.$(shuf -i 1-255 -n 1) --> [ACK]${NC}"; sleep 0.8
        done; read -p "Enter..." ;;

    00) exit ;;
esac
done