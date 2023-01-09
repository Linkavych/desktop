#!/bin/sh
#==============================================================================#
#
#   FILE: libraries.sh
#                   
#   USAGE: ./libraries.sh
#                   
#   DESCRIPTION: Various libraries necessary for the installation of binaries.
#
#   AUTHOR: Adam V. Link (linkavych)
#   CREATED: 2023-01-08
#   MODIFIED: --
#   VERSION: 0.1
#
#   LICENSE: BSD 3-Clause (copy in repo)
#==============================================================================#

if [ "$EUID" -ne 0 ]; then
    echo "[!] Must be run as root!"
    exit 1;
fi

echo "[+] Beginning library installation..."

while read -r line; do
    echo "[+] Installing library: $line"
    apt install "$line";
done

echo "[+] Installation complete!"


