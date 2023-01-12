#!/bin/bash

# DOT_DIR="$HOME/dotfiles"

NVIM_DIR="$HOME/.config/nvim"
today=$(date +"%Y-%m-%d_%X") # пример формата 2022-05-02_13:40:03


echo "[*] Start inject dot files in system"

# Если ~/.config/nvim уже существует (и это папка), скопируем её в каталог
# ~/.config с именем nvim_YYYY-mm-dd_HH:MM:SS.
if [ -d "$NVIM_DIR" ] 
then 
   echo "[NVIM] $NVIM_DIR exists on your filesystem. Backup nvim dir"
   cp -rL "$NVIM_DIR" "${NVIM_DIR}_${today}"
fi

# Создать символические ссылки
# ---------------------------------------------------------------------

# Alacritty
mkdir -p ~/.config/alacritty
ln -sf "$PWD"/alacritty.yml "$HOME"/.config/alacritty/alacritty.yml

# Zsh
ln -sf "$PWD"/zshrc "$HOME"/.zshrc

# P10k
ln -sf "$PWD"/p10k.zsh "$HOME"/.p10k.zsh

# Vim
ln -sf "$PWD"/vimrc "$HOME"/.vimrc

# Nvim
ln -sf "$PWD"/nvim "$HOME"/.config

# Tmux
ln -sf "$PWD"/tmux.conf "$HOME"/.tmux.conf

# Vifm
mkdir -p ~/.config/vifm
ln -sf "$PWD"/vifmrc "$HOME"/.config/vifm/vifmrc
# ---------------------------------------------------------------------


echo "[*] Done inject files"

