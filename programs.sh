#!/bin/sh
#==============================================================================#
#
#   FILE: programs.sh
#                   
#   USAGE: ./programs.sh
#                  
#   DESCRIPTION: Installs base programs that /should/ be available in the Debian
#                or Ubuntu repositories.
#
#   AUTHOR: Adam V. Link (linkavych)
#   CREATED: 2023-01-08
#   MODIFIED: -- 
#   VERSION:0.1
#
#   LICENSE: BSD 3-Clause (copy in repo)
#==============================================================================#
# Check for root
if [ "$EUID" -ne 0 ]; then
    echo "[!] Need to execute as root!"
    exit 1
fi

# Do system update
echo "[+] BEGIN SYSTEM UPDATE"

if ! apt update -y; then
    echo "[!] Failed to update the system!"
    exit 1
fi

echo "[+] BEGIN INSTALLATION"

# Install programs listed in programs.txt
while read -r line; do
    echo "[+] Installing $line"
    if ! apt install -y "$line"; then
        echo "[!] Failed to install $line"
    fi
done < "programs.txt"

# Remove unnecessary packages and libraries
if ! apt autoremove -y; then
    echo "[!] Failed to remove unnecessary packages!"
    exit 1
fi

echo "[+] Installation complete!"
