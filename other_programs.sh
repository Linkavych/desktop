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
#!/bin/sh

set -e

# Rust Installation
if ! curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh; then
    echo "[!] Failed to install Rust!"
    exit 1
fi

# Rust Binaries

if ! cargo install lsd; then
    echo "[!] Failed to install lsd!"
    exit 1
fi

if ! cargo install ripgrep; then
    echo "[!] Failed to install ripgrep!"
    exit 1
fi

if ! strip ~/.cargo/bin/lsd; then
    echo "[!] Failed to strip lsd binary!"
    exit 1
fi

if ! strip ~/.cargo/bin/rg; then
    echo "[!] Failed to strip ripgrep binary!"
    exit 1
fi

# Neovim Build and Install
if ! cd /tmp; then
    echo "[!] Failed to change to /tmp directory!"
    exit 1
fi

if ! git clone https://github.com/neovim/neovim; then
    echo "[!] Failed to clone Neovim repository!"
    exit 1
fi

if ! cd neovim; then
    echo "[!] Failed to change to Neovim directory!"
    exit 1
fi

if ! make CMAKE_BUILD_TYPE=RelWithDebInfo; then
    echo "[!] Failed to build Neovim!"
    exit 1
fi

if ! sudo make install; then
    echo "[!] Failed to install Neovim!"
    exit 1
fi

if ! cd /tmp; then
    echo "[!] Failed to change to /tmp directory!"
    exit 1
fi

if ! rm -rf neovim; then
    echo "[!] Failed to remove Neovim source code!"
    exit 1
fi

# Vim plug install
if ! sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'; then
    echo "[!] Failed to install Vim plug!"
    exit 1
fi

# Starship prompt
if ! curl -sS https://starship.rs/install.sh | sh; then
    echo "[!] Failed to install Starship prompt!"
    exit 1
fi

# Install Obsidian (check version link)
if ! wget -O obsidian.deb -P /tmp https://github.com/obsidianmd/obsidian-releases/releases/download/v1.1.9/obsidian_1.1.9_amd64.deb; then
    echo "[!] Failed to download Obsidian!"
    exit 1
fi

if ! sudo dpkg -i /tmp/obsidian.deb; then
    echo "[!] Failed to install Obsidian!"
    exit 1
fi

if ! rm -f /tmp/obsidian.deb; then
    echo "[!] Failed to remove obsidian.deb!"
    exit 1
fi

echo "[+] OTHER PROGRAMS INSTALLATION COMPLETE"
