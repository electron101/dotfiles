
#!/bin/bash
echo "[*] Start inject files in system"
mkdir ~/.config/nvim
ln -sf ~/.dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -sf ~/.dotfiles/zshrc ~/.zshrc
ln -sf ~/.dotfiles/vimrc ~/.vimrc
ln -sf ~/.dotfiles/init.vim ~/.config/nvim/init.vim
ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf
echo "[*] Done inject files"
