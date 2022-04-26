#!/bin/bash
echo "[*] Start inject dot files in system"

#mkdir -p ~/.config/nvim
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/vifm

ln -sf ~/.dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -sf ~/.dotfiles/zshrc ~/.zshrc
ln -sf ~/.dotfiles/p10k.zsh ~/.p10k.zsh
ln -sf ~/.dotfiles/vimrc ~/.vimrc
ln -sf ~/.dotfiles/nvim ~/.config
ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/vifmrc ~/.config/vifm/vifmrc

echo "[*] Done inject files"
