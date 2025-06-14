#!/bin/bash

# Define package lists
yay_apps="brightnessctl discord google-chrome python spotify visual-studio-code-bin librewolf-bin"
pacman_apps="alacritty arandr blueman sddm pulseaudio pavucontrol bat github-cli go hugo nodejs \
thunar neovim npm nitrogen obs-studio picom polybar python-pip ranger redshift sxhkd vim zsh \
rsync i3-wm i3lock networkmanager lxappearance rofi"

# Install yay (AUR helper)
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si && cd .. && rm -rf yay

# Install packages from official repos and AUR
sudo pacman -Syy --noconfirm $pacman_apps
yay -Syy --noconfirm $yay_apps

# Enable NetworkManager
sudo systemctl enable --now NetworkManager

# Global npm tools
sudo npm i -g gitmoji-cli

# Restore dotfiles
sudo rsync -av --chown="$USER:$USER" --exclude '.git' tmpdotfiles/ "$HOME/"
rm -rf tmpdotfiles

# Restore fonts
sudo cp -r ./.local/share/fonts /usr/share/fonts
fc-cache -fv

# Install Oh My Zsh (unattended)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Clone Zsh plugins # ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
git clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git "$ZSH_CUSTOM/plugins/fast-syntax-highlighting"
git clone --depth 1 https://github.com/marlonrichert/zsh-autocomplete.git "$ZSH_CUSTOM/plugins/zsh-autocomplete"

# Install NvChad starter config
git clone https://github.com/NvChad/starter ~/.config/nvim

# Install SDDM theme
sh -c "$(curl -fsSL https://raw.githubusercontent.com/keyitdev/sddm-astronaut-theme/master/setup.sh)"

# Change default shell to Zsh
chsh -s /bin/zsh

# Done
echo -e '\033[1;32m:: Installation completed!!\033[0m'
echo -e '\033[1;33m:: PLEASE: REBOOT YOUR PC!!\033[0m'