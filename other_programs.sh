#!/bin/sh
#==============================================================================#
#
#   FILE: other_programs.sh
#                   
#   USAGE: ./other_programs.sh
#                   
#   DESCRIPTION: Installation script for programs that are either build from 
#                source, require extra input, or otherwise are not in a package
#                repository.
#
#   AUTHOR: Adam V. Link (linkavych)
#   CREATED: 2023-01-08
#   MODIFIED: --
#   VERSION: 0.1
#
#   LICENSE: BSD 3-Clause (copy in repo)
#==============================================================================#

# Rust Installation
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Rust Binaries

cargo install lsd
cargo install ripgrep

strip ~/.cargo/bin/lsd
strip ~/.cargo/bin/rg

# Neovim Build and Install
cd /tmp
git clone https://github.com/neovim/neovim
cd neovim

make CMAKE_BUILD_TYPE=RelWithDebInfo

sudo make install

cd /tmp
rm -rf neovim

# Vim plug install

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Starship prompt

curl -sS https://starship.rs/install.sh | sh

# Install Obsidian (check version link)
wget -O obsidian -P ~/.bin/ https://github.com/obsidianmd/obsidian-releases/releases/download/v1.1.9/obsidian_1.1.9_amd64.deb
