#!/bin/bash

# Install yay
sudo pacman -S --needed --noconfirm base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Update packages
sudo pacman -Syu
yay -Syu 
# Install general system apps on the pacman repository
sudo pacman -S --needed --noconfirm ninja cmake ly dolphin grim slurp rofi \
hyprland hyprshade hypridle hyprpaper hyprlock hyprshot hyprpicker hyprland-qt-support hyprland-qutils hyprsunset \
swaync swayimg waybar cliphist foot alacritty cava fastfetch cowsay \
zathura zathura-pdf-poppler vlc gvfs gvfs-mtp gvfs-smb unzip p7zip unrar blueman flatpak \
wl-clipboard pavucontrol playerctl bluez bluez-utils wireplumber polkit-kde-agent \
qt5-wayland qt6-wayland xdg-desktop-portal-hyprland xdg-user-dirs xdg-desktop-portal pipewire-pulse

xdg-user-dirs-update

# Install nerd font
sudo pacman -Ss jetbrains nerd
sudo pacman -S ttf-jetbrains-mono-nerd

# Install with AUR
yay -S vicinae-bin wlogout cbonsai-git

# Install ollama
curl -fsSL https://ollama.com/install.sh | sh

# Neovim

# Install Neovim's latest version from GitHub
curl -LO https://github.com/neovim/neovim/releases/download/v0.11.4/nvim-linux-x86_64.tar.gz
tar -xvzf nvim-linux-x86_64.tar.gz
sudo mkdir /usr/bin/nvim
sudo mv ./nvim-linux-x86_64/* /usr/bin/nvim
# Installing LazyVim
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

git clone https://github.com/abishekvashok/cmatrix.git
cd cmatrix
mkdir -p Build && cd Build
cmake ..
make
make install

mv ./wallpapers ~/Pictures/

mv ./confs/fastfetch ~/.config/
mv ./confs/hypr ~/.config/
mv ./confs/waybar ~/.config/
mv ./confs/swaync ~/.config/

echo 'export PATH=$PATH:/usr/bin/nvim/bin/' >> ~/.bashrc
echo "fastfetch" >> ~/.bashrc

sudo systemctl enable ly
sudo systemctl start ly

rm -rf ./nvim-linux-x86_64* ./cmatrix