#!/bin/sh
#==============================================================================#
#
#   FILE: fonts.sh
#                   
#   USAGE: ./fonts.sh
#                   
#   DESCRIPTION: Automates the installation of various nerd 
#                fonts on a new system.
#
#   AUTHOR: Adam V. Link (linkavych)
#   CREATED: 2023-01-08
#   MODIFIED: --
#   VERSION: 0.1
#
#   LICENSE: BSD 3-Clause (copy in repo)
#==============================================================================#
echo -e "[+] Installing fonts..."
echo -e "[+] Changing to /tmp..."

cd /tmp

echo -e "[+] Cloning nerd-fonts repository. This will take a minute..."
git clone https://github.com/ryanoasis/nerd-fonts.git

echo -e "[+] Cloning complete...installing fonts..."

cd nerd-fonts

chmod +x install.sh

./install.sh Hack
./install.sh Gohu
./install.sh Noto
./install.sh FiraCode
./install.sh FiraMono
./install.sh FantasqueSansMono
./install.sh SourceCodePro
./install.sh DejaVuSansMono

cd /tmp

echo -e "[+] Cleaning up and removing nerd-fonts..."
rm -rf nerd-fonts/

echo -e "[+] Install complete!"
