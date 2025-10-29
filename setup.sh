#!/bin/bash

# Install yay
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Update packages
sudo pacman -Syu
yay -Syu 
# Install general system apps on the pacman repository
sudo pacman -S --needed --noconfirm ninja cmake ly dolphin grim slurp rofi \
hyprland hyprshade hypridle hyprpaper hyprlock hyprshot hyprpicker hyprland-qt-support hyprland-qutils hyprsunset \
swaync swayimg waybar cliphist foot alacritty cava fastfetch cowsay gnome-calendar gnome-calculator \
zathura zathura-pdf-poppler vlc gvfs gvfs-mtp gvfs-smb xarchiver unzip p7zip unrar blueman flatpak wine \
wl-clipboard pavucontrol playerctl bluez bluez-utils wireplumber polkit-kde-agent \
qt5-wayland qt6-wayland xdg-desktop-portal-hyprland xdg-user-dirs xdg-desktop-portal pipewire-pulse

xdg-user-dirs-update

# Install nerd font
sudo pacman -Ss jetbrains nerd
sudo pacman -S ttf-jetbrains-mono-nerd

# Install with AUR
yay -S vicinae-bin wlogout cbonsai-git kiview cmatrix-git

# Install various flatpaks
flatpak install flathub app.zen_browser.zen
flatpak install flathub com.brave.Browser
flatpak install flathub com.valvesoftware.Steam
flatpak install flathub com.heroicgameslauncher.hgl
flatpak install flathub org.vinegarhq.Sober
flatpak install flathub net.pcsx2.PCSX2
flatpak install flathub io.github.giantpinkrobots.flatsweep
flatpak install flathub org.srb2.SRB2
flatpak install flathub com.spotify.Client

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

mv ./wallpapers ~/Pictures/
mv ./confs/rofi-themes/* /usr/share/rofi/themes

mv ./confs/fastfetch ~/.config/
mv ./confs/hypr ~/.config/
mv ./confs/waybar ~/.config/
mv ./confs/swaync ~/.config/
mv ./confs/rofi ~/.config/
mv ./confs/wlogout ~/.config/

echo 'export PATH=$PATH:/usr/bin/nvim/bin/' >> ~/.bashrc
echo "fastfetch" >> ~/.bashrc

sudo systemctl enable ly
sudo systemctl start ly

rm -rf ./nvim-linux-x86_64* ./cmatrix