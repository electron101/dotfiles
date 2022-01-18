#!/bin/bash
echo "[*] Start inject files in system"
mkdir ~/.config/nvim
mkdir ~/.config/alacritty
mkdir ~/.config/vifm
ln -sf ~/.dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -sf ~/.dotfiles/zshrc ~/.zshrc
ln -sf ~/.dotfiles/vimrc ~/.vimrc
ln -sf ~/.dotfiles/init.vim ~/.config/nvim/init.vim
ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/vifmrc ~/.config/vifm/vifmrc
echo "[*] Done inject files"
