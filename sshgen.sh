#!/bin/sh
#==============================================================================#
#
#   FILE: sshgen.sh
#                   
#   USAGE: ./sshgen.sh <email>
#                   
#   DESCRIPTION: Generate new ssh keys and add them to the agent.
#
#   AUTHOR: Adam V. Link (linkavych)
#   CREATED: 2023-01-08
#   MODIFIED: --
#   VERSION: 0.1
#
#   LICENSE: BSD 3-Clause (copy in repo)
#==============================================================================#

echo "[+] Generating new ssh keys for the new system..."

if [ "$#" -ne 1 ]; then
    echo "[!] Provide an email address for the ssh keys!"
    exit 1
fi

ssh-keygen -t ed25519 -C "$(EMAIL)" -f ~/.ssh/primary_ed25519

eval "$(ssh-agent -s)"

ssh-add ~/.ssh/primary_ed25519

echo "[+] New keys added to agent."
echo "[+] Update github/gitlab repositories with new keys before proceeding..."

