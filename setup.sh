#!/bin/bash

# Install yay
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

cd ..

sudo systemctl enable --now bluetooth.service

# Install general system apps on the pacman repository
sudo pacman -S --needed --noconfirm hypridle hyprpaper hyprlock hyprshot hyprpicker hyprland-qt-support hyprsunset \
swaync swayimg waybar cliphist foot alacritty cava fastfetch cowsay gnome-calendar gnome-calculator \
zathura zathura-pdf-poppler vlc gvfs gvfs-mtp gvfs-smb xarchiver unzip p7zip unrar blueman flatpak wine \
wl-clipboard pavucontrol playerctl bluez bluez-utils wireplumber \
xdg-user-dirs xdg-desktop-portal pipewire-pulse libnotify python xdg-utils \
ninja cmake gum

xdg-user-dirs-update

# Install nerd font
sudo pacman --noconfirm -S ttf-jetbrains-mono-nerd

# Install with AUR
yay --answerdiff None --answerclean None --noconfirm -S vicinae-bin wlogout cbonsai kiview cmatrix-git hyprshade nomacs hellwal dyn-wall-rs

# Install various flatpaks
flatpak install -y flathub app.zen_browser.zen \
com.brave.Browser com.valvesoftware.Steam com.heroicgameslauncher.hgl \
org.vinegarhq.Sober net.pcsx2.PCSX2 io.github.giantpinkrobots.flatsweep \
org.srb2.SRB2 com.spotify.Client org.gnome.gitlab.somas.Apostrophe \
com.obsproject.Studio org.videolan.VLC md.obsidian.Obsidian

# Just gonna leave this here in case I figure it out how to put Wacom drivers in Arch
# Or when I feel like it
#
# flatpak install -y flathub org.kde.krita com.github.libresprite.LibreSprite com.github.PintaProject.Pinta \
# fm.reaper.Reaper org.kartkrew.RingRacers

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

# SDDM Theme (Credits to keyitdev. https://github.com/Keyitdev/sddm-astronaut-theme)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/keyitdev/sddm-astronaut-theme/master/setup.sh)"

cp ./wallpapers ~/Pictures/

cp ./confs/* ~/.config/

echo 'export PATH=$PATH:/usr/bin/nvim/bin/' >> ~/.bashrc
echo "fastfetch" >> ~/.bashrc

./theme.sh frieren light

mv theme.sh ~/

sudo systemctl enable bluetooth
sudo systemctl start bluetooth

rm -rf ./nvim-linux-x86_64* ./yay