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
if [ "$EUID" -ne 0 ]; then
    echo "[!] Need to execute as root!"
    exit 1
fi

echo "[+] Upgrading system..."

apt update -y

echo "[+] Installing desired programs..."

while read -r line; do
    echo "[+] Installing $line"
    apt install -y $line;
done < "programs.txt"

apt autoremove -y

echo "[+] Installation complete!"
