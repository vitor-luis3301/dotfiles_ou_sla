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

cp ./wallpapers ~/Pictures/
cp ./confs/rofi-themes/* /usr/local/share/rofi/themes

cp ./confs/fastfetch ~/.config/
cp ./confs/hypr ~/.config/
cp ./confs/waybar ~/.config/
cp ./confs/swaync ~/.config/
cp ./confs/rofi ~/.config/
cp ./confs/wlogout ~/.config/

echo 'export PATH=$PATH:/usr/bin/nvim/bin/' >> ~/.bashrc
echo "fastfetch" >> ~/.bashrc

./theme.sh frieren light

mv theme.sh ~/

rm -rf ./nvim-linux-x86_64* ./yay