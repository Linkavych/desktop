#!/bin/sh
#==============================================================================#
#
#   FILE: pymods.sh 
#                   
#   USAGE: ./pymods.sh
#                   
#   DESCRIPTION: Installs a variety of python3 libraries.
#
#   AUTHOR: Adam V. Link (linkavych)
#   CREATED: 2023-01-08
#   MODIFIED: --
#   VERSION: 0.1
#
#   LICENSE: BSD 3-Clause (copy in repo)
#==============================================================================#
if [ "$EUID" -eq 0 ]; then
    echo "[!] DO NOT RUN AS ROOT! Install python modules as a user!"
    exit 1
fi

while read -r line; do
    echo "[+] Installing module: $line"
    if ! python3 -m pip install --user "$line";then
        echo "[!] Failed to install $line"
    fi
done < pymodules.txt

# Ensure pipx PATH is set
if ! python3 -m pipx ensurepath; then
    echo "[!] Path not set for pipx!"
    exit 1
fi

# Install things via pipx that make sense
while read -r mod; do
    echo "[+] Installing module via pipx: $mod"
    if ! python3 -m pipx install "$mod";then
        echo "[!] Failed to install $mod with pipx!"
    fi
done < pipx_mods.txt


