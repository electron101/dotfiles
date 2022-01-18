#!/bin/bash

echo "[*] Start install shell addons"


# === [ Oh My Zsh ] ===
# Install:
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#
# Plugins for Oh My Zsh:
# Download zsh-autosuggestions by
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
# Download zsh-syntax-highlighting by
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# === [ Powerlevel10k ] ===
# https://github.com/romkatv/powerlevel10k#installation
#
# В связке с Oh My Zsh:
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo "[*] Done install shell addons"
