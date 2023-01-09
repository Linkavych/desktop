#!/bin/bash
#==============================================================================#
#
#   FILE: user_config.sh
#                   
#   USAGE: ./user_config.sh
#                   
#   DESCRIPTION: Sets up all configuration files and directory structure.
#
#   AUTHOR: Adam V. Link (linkavych)
#   CREATED: 2023-01-08
#   MODIFIED: -- 
#   VERSION: 0.1
#
#   LICENSE: BSD 3-Clause (copy in repo)
#==============================================================================#
read -n 1 -p "Did you generate new ssh-keys and add them to Github? (y/n)" resp
echo ""
case $resp in
    y|Y) echo -e "[+] Continuing to configure user system..." ;;
    n|N) echo -e "[!] Configure your ssh-keys first!"; exit 1 ;;
esac

# Begin configuration
cd $HOME

# Remove default directories not used
rmdir Templates Pictures Videos Music Public

# Make some enw directories
mkdir -pv $HOME/opt $HOME/development

echo -e "[+] Cloning and setting up dotfiles..."

cd $HOME/opt/

git clone git@github:Linkavych/dotfiles.git

cd $HOME/opt/dotfiles

make

cd $HOME/development

echo -e "[+] Cloning all development repositories..."

git clone git@github:Linkavych/malware_analysis_scripts.git

git clone git@github:Linkavych/malware_dev.git

git clone git@github:Linkavych/malware_reports.git

git clone git@github:Linkavych/linkavych.github.io.git blog

git clone git@github:Linkavych/programming.git

echo -e "[+] Cloning obsidian notes repository..."

cd $HOME/Documents

git clone git@github.com:Linkavych/Notes.git
