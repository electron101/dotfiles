#!/bin/bash
 

# TODO:
# [-] Продумать механизм обновления (git pull, fetch ???) всех реп
 

# DONE:
# [+] Не ставить ohmyzsh, вместо него ставить antidote. Возможно в дальнейшем
# вообще отказаться от системы плагинов и писать всё только в .zshrc, но пока
# меня всё устраивает и так.
# [+] Не ставить плагины zsh через ohmyzsh. Теперь они находятся в файле
# zsh_plugins.txt
# [+] Добавить вывод исполнения каждой команды, что бы было понятно что
# происходит и что ставиться





echo "[*] Start install shell addons"



# === [ Antidote ] ===
# https://getantidote.github.io/install
# Install:
if [ -d "${ZDOTDIR:-$HOME}/.antidote" ]
then 
	echo "[-] ${ZDOTDIR:-$HOME}/.antidote уже сущесвует"
else
	echo "[-] Install Antidote in ${ZDOTDIR:-$HOME}/.antidote"
        git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-$HOME}/.antidote
fi



# === [ Vifm-colors ] ===
if [ -d ~/.config/vifm/colors ]
then 
	echo "[-] ~/.config/vifm/colors уже сущесвует"
else 
	echo "[-] Install Vifm-colors in $HOME/.config/vifm/colors"
	git clone https://github.com/vifm/vifm-colors ~/.config/vifm/colors
fi



# === [Tmux Plugin Manager] ====
if [ -d ~/.tmux/plugins/tpm ]
then 
	echo "[-] ~/.tmux/plugins/tpm уже сущесвует"
else
	echo "[-] Install Tmux Plugin Manager in $HOME/.tmux/plugins/tpm"
	git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm && $HOME/.tmux/plugins/tpm/bin/install_plugins
fi



# === [Alacritty-themes CLI] ===
# пока не могу скопировать доступ запрещён, приходиться копировать вручную
# if [ -d /usr/lib/node_modules/alacritty-themes/themes ]
# then 
# 	cp alacritty-themes/* /usr/lib/node_modules/alacritty-themes/themes/
# fi



# === [Vim-Plug for Neovim, Unix/Linux] ====
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'




echo "[*] Done install shell addons"
