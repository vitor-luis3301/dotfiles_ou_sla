#!/bin/bash

# Install yay
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

cd ..
# Install general system apps on the pacman repository
sudo pacman -S --needed --noconfirm ninja cmake rofi \
hypridle hyprpaper hyprlock hyprshot hyprpicker hyprland-qt-support hyprsunset \
swaync swayimg waybar cliphist foot alacritty cava fastfetch cowsay gnome-calendar gnome-calculator \
zathura zathura-pdf-poppler vlc gvfs gvfs-mtp gvfs-smb xarchiver unzip p7zip unrar blueman flatpak wine \
wl-clipboard pavucontrol playerctl bluez bluez-utils wireplumber \
xdg-user-dirs xdg-desktop-portal pipewire-pulse libnotify python python-pywal

xdg-user-dirs-update

# Install nerd font
sudo pacman -Ss jetbrains nerd
sudo pacman -S ttf-jetbrains-mono-nerd

# Install with AUR
yay --noprovides --answerdiff None --answerclean None --noconfirm vicinae-bin wlogout cbonsai-git kiview cmatrix-git hyprshade

# Install ollama
curl -fsSL https://ollama.com/install.sh | sh

# Neovim

# Install Neovim's latest version from GitHub
curl -LO https://github.com/neovim/neovim/releases/download/v0.11.4/nvim-linux-x86_64.tar.gz
tar -xvzf nvim-linux-x86_64.tar.gz
sudo mkdir /usr/bin/nvim
sudo mv ./nvim-linux-x86_64/* /usr/bin/nvim

mv ./wallpapers ~/Pictures/
mv ./confs/rofi-themes/* /usr/local/share/rofi/themes

mv ./confs/fastfetch ~/.config/
mv ./confs/hypr ~/.config/
mv ./confs/waybar ~/.config/
mv ./confs/swaync ~/.config/
mv ./confs/rofi ~/.config/
mv ./confs/wlogout ~/.config/

echo 'export PATH=$PATH:/usr/bin/nvim/bin/' >> ~/.bashrc
echo "fastfetch" >> ~/.bashrc

./theme frieren light

rm -rf ./nvim-linux-x86_64* ./yay