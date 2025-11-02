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
xdg-user-dirs xdg-desktop-portal pipewire-pulse libnotify python python-pywal \
ninja cmake

xdg-user-dirs-update

# Install nerd font
sudo pacman --noconfirm -S ttf-jetbrains-mono-nerd

# Install with AUR
yay --answerdiff None --answerclean None --noconfirm -S vicinae-bin wlogout cbonsai kiview cmatrix-git hyprshade

# Install various flatpaks
flatpak install -y flathub app.zen_browser.zen
flatpak install -y flathub com.brave.Browser
flatpak install -y flathub com.valvesoftware.Steam
flatpak install -y flathub com.heroicgameslauncher.hgl
flatpak install -y flathub org.vinegarhq.Sober
flatpak install -y flathub net.pcsx2.PCSX2
flatpak install -y flathub io.github.giantpinkrobots.flatsweep
flatpak install -y flathub org.srb2.SRB2
flatpak install -y flathub com.spotify.Client
flatpak install -y flathub org.gnome.gitlab.somas.Apostrophe

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

cp ./wallpapers ~/Pictures/
cp ./confs/rofi-themes/* /usr/share/rofi/themes

cp ./confs/fastfetch ~/.config/
cp ./confs/hypr ~/.config/
cp ./confs/waybar ~/.config/
cp ./confs/swaync ~/.config/
cp ./confs/rofi ~/.config/
cp ./confs/wlogout ~/.config/
cp ./confs/cava ~/.config/

echo 'export PATH=$PATH:/usr/bin/nvim/bin/' >> ~/.bashrc
echo "fastfetch" >> ~/.bashrc

./theme.sh frieren light

mv theme.sh ~/

sudo systemctl enable bluetooth
sudo systemctl start bluetooth

rm -rf ./nvim-linux-x86_64* ./yay