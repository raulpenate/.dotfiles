#!/bin/bash
yayapps="brightnessctl discord google-chrome python spotify visual-studio-code-bin"
pacmanapps="alacritty bat bspwm github-cli go hugo nodejs neovim npm nitrogen obs-studio picom polybar python-pip ranger redshift sxhkd vim zsh"

# Install 
sudo pacman -Syy $pacmanapps --noconfirm 
yay -Syy $yayapps --noconfirm

# Node
sudo npm i -g gitmoji-cli

# Restoring dotfiles
sudo rsync -og --chown=$USER:$USER --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
rm -rf tmpdotfiles

# OH-MY-ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
chsh - s /bin/zsh

# Plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete

# Chad NVIM
git clone https://github.com/NvChad/starter ~/.config/nvim

echo -e '\033[1m:: INSTALLATION COMPLETED!!\033[0m'