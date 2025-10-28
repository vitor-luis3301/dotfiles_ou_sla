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
sudo pacman -S base-devel hyprland dolphin polkit-kde-agent qt5-wayland qt6-wayland grim slurp wofi xdg-desktop-portal-hyprland swaync hyprpaper hyprlock gvfs gvfs-mtp gvfs-smb unzip p7zip unrar waybar blueman foot cava flatpak wl-clipboard zathura zathura-pdf-poppler vlc pavucontrol cliphist wlsunset playerctl bluez bluez-utils pipewire-pulse pipewire-bluetooth wireplumber swayimg fastfetch xdg-desktop-portal ninja cmake xdg-user-dirs

# Install nerd font
sudo pacman -Ss jetbrains nerd
sudo pacman -S ttf-jetbrains-mono-nerd

# Install with AUR
yay -S vicinae-bin wlogout hyprshade hypridle

# Install various flatpaks
flatpak install io.github.nyre221.kiview
flatpak install flathub app.zen_browser.zen
flatpak install flathub com.brave.Browser
flatpak install flathub com.valvesoftware.Steam
flatpak install flathub com.heroicgameslauncher.hgl
flatpak install flathub org.vinegarhq.Sober
flatpak install flathub md.obsidian.Obsidian
flatpak install flathub net.pcsx2.PCSX2
flatpak install flathub io.github.giantpinkrobots.flatsweep
flatpak install flathub org.srb2.SRB2
flatpak install flathub com.spotify.Client
flatpak install flathub org.winehq.Wine
flatpak install flathub org.kde.spectacle
flatpak install flathub org.gnome.Calendar
flatpak install flathub org.gnome.FileRoller
flatpak install flathub org.gnome.Calculator

# Install ollama
curl -fsSL https://ollama.com/install.sh | sh

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