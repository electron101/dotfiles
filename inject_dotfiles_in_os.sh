#!/bin/bash

NVIM_DIR="$HOME/.config/nvim"
today=$(date +"%Y-%m-%d_%X") # пример формата 2022-05-02_13:40:03


echo "[*] Start inject dot files in system"

# Если ~/.config/nvim уже существует (и это папка), переименуем её.
#
if [ -d "$NVIM_DIR" ] 
then 
   echo "$NVIM_DIR exists on your filesystem. Rename dir"
   mv -- "$NVIM_DIR" "${NVIM_DIR}_${today}"
fi

mkdir -p ~/.config/alacritty
mkdir -p ~/.config/vifm

# Создать символические ссылки
# ---------------------------------------------------------------------

# Alacritty
ln -sf ~/.dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml

# Zsh
ln -sf ~/.dotfiles/zshrc ~/.zshrc

# P10k
ln -sf ~/.dotfiles/p10k.zsh ~/.p10k.zsh

# Vim
ln -sf ~/.dotfiles/vimrc ~/.vimrc

# Nvim
ln -sf ~/.dotfiles/nvim ~/.config

# Tmux
ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf

# Vifm
ln -sf ~/.dotfiles/vifmrc ~/.config/vifm/vifmrc
# ---------------------------------------------------------------------


echo "[*] Done inject files"

