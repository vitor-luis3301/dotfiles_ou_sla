#!/bin/bash

# Install yay
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Update packages
sudo pacman -Syu
yay -Syu
# Install general system apps on the pacman repository
sudo pacman -S base-devel hyprland dolphin polkit-kde-agent ly qt5-wayland qt6-wayland grim slurp wofi xdg-desktop-portal-hyprland swaync hyprpaper hyprlock gvfs gvfs-mtp gvfs-smb unzip p7zip unrar waybar blueman foot cava flatpak wl-clipboard zathura zathura-pdf-poppler vlc pavucontrol cliphist wlsunset playerctl bluez bluez-utils pipewire-pulse pipewire-bluetooth wireplumber swayimg fastfetch xdg-desktop-portal ninja cmake xdg-user-dirs

# Install nerd font
sudo pacman -Ss jetbrains nerd
sudo pacman -S ttf-jetbrains-mono-nerd

# Install with AUR
yay -S vicinae-bin wlogout hyprshade hypridle

# Neovim

# Install Neovim's latest version from GitHub
curl -LO https://github.com/neovim/neovim/releases/download/v0.11.4/nvim-linux-x86_64.tar.gz
tar -xvzf nvim-linux-x86_64.tar.gz
sudo mkdir /usr/bin/nvim
sudo mv ./nvim-linux-x86_64/* /usr/bin/nvim/
rm -rf ./nvim-linux-x86_64*

# Installing LazyVim
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

mv ./wallpapers ~/Pictures/
mv ./confs/fastfetch ~/.config/
mv ./confs/hypr ~/.config/
mv ./confs/waybar ~/.config/
mv ./confs/swaync ~/.config/

echo 'export PATH=$PATH:/usr/bin/nvim/bin/' >> ~/.bashrc
echo "fastfetch" >> ~/.bashrc

sudo systemctl enable ly
sudo systemctl start ly