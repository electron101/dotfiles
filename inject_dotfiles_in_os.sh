#!/bin/bash

DOT_DIR="$HOME/dotfiles"

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
ln -sf "$DOT_DIR"/alacritty.yml "$HOME"/.config/alacritty/alacritty.yml

# Zsh
ln -sf "$DOT_DIR"/zshrc "$HOME"/.zshrc

# P10k
ln -sf "$DOT_DIR"/p10k.zsh "$HOME"/.p10k.zsh

# Vim
ln -sf "$DOT_DIR"/vimrc "$HOME"/.vimrc

# Nvim
ln -sf "$DOT_DIR"/nvim "$HOME"/.config

# Tmux
ln -sf "$DOT_DIR"/tmux.conf "$HOME"/.tmux.conf

# Vifm
mkdir -p ~/.config/vifm
ln -sf "$DOT_DIR"/vifmrc "$HOME"/.config/vifm/vifmrc
# ---------------------------------------------------------------------


echo "[*] Done inject files"

