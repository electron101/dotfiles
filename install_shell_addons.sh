#!/bin/bash

echo "[*] Start install shell addons"


# === [ Oh My Zsh ] ===
# Install:
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Plugins for Oh My Zsh:
#
# Download zsh-autosuggestions by
if [ -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]
then 
	echo "[-] ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions уже сущесвует"
else 
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi
#
# Download zsh-syntax-highlighting by
if [ -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]
then 
	echo "[-] ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting уже сущесвует"
else 
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi
#
# === [ Powerlevel10k ] ===
# https://github.com/romkatv/powerlevel10k#installation
#
# В связке с Oh My Zsh:
if [ -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]
then 
	echo "[-] ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k уже сущесвует"
else
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# === [ Vifm-colors ] ===
if [ -d ~/.config/vifm/colors ]
then 
	echo "[-] ~/.config/vifm/colors уже сущесвует"
else 
	git clone https://github.com/vifm/vifm-colors ~/.config/vifm/colors
fi


# === [Tmux Plugin Manager] ====
if [ -d ~/.tmux/plugins/tpm ]
then 
	echo "[-] ~/.tmux/plugins/tpm уже сущесвует"
else
	git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm && $HOME/.tmux/plugins/tpm/bin/install_plugins
fi

echo "[*] Done install shell addons"
