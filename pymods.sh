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
    python3 -m pip install --user "$line";
done < pymodules.txt

# Ensure pipx PATH is set
python3 -m pipx ensurepath

# Install things via pipx that make sense
while read -r mod; do
    echo "[+] Installing module via pipx: $mod"
    python3 -m pipx install "$mod";
done < pipx_mods.txt


