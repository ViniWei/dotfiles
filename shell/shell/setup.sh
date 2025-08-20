#!/bin/bash/env bash

setup_string=". $HOME/shell/bashrc_custom.sh"
bashrc="$HOME/.bashrc"

if ! grep -qF "$setup_string" $bashrc; then
    echo "$setup_string" >> $bashrc
fi

sudo apt update
sudo apt install stow
sudo apt install clang
sudo apt install fzf
sudo apt install xclip
sudo apt install tmux
sudo apt install ripgrep
sudo snap install --classic nvim
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
curl -sS https://starship.rs/install.sh | sh

. $bashrc
