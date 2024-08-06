#!/bin/bash
yayapps="vim zsh brightnessctl python google-chrome visual-studio-code-bin discord"
pacmanapps="vim bspwm sxhkd polybar picom alacritty nitrogen ranger nitrogen github-cli"

# Install 
pacman -Syy $pacmanapps --noconfirm 
yay -Syy $yayapps --noconfirm

# OH-MY-ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Create dotfiles
rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
rm -r tmpdotfiles
echo -e '\033[1m:: INSTALLATION COMPLETED!\033[0m'v