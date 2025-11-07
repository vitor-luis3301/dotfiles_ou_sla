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
swaync waybar cliphist foot alacritty cava fastfetch cowsay gnome-calendar gnome-calculator \
zathura zathura-pdf-poppler vlc gvfs gvfs-mtp gvfs-smb xarchiver unzip p7zip unrar blueman flatpak wine \
wl-clipboard pavucontrol playerctl bluez bluez-utils wireplumber \
xdg-user-dirs xdg-desktop-portal pipewire-pulse libnotify python xdg-utils \
ninja cmake gum

# Make user directories automatically (~/Desktop, ~/Videos, ~/Downloads, etc.)
xdg-user-dirs-update

# Install nerd font
sudo pacman --noconfirm -S ttf-jetbrains-mono-nerd

# Install with AUR
yay --answerdiff None --answerclean None --noconfirm -S vicinae-bin wlogout cbonsai cmatrix-git hyprshade nomacs hellwal dyn-wall-rs ttf-twemoji

# Neovim

# Install Neovim's latest version from GitHub
curl -LO https://github.com/neovim/neovim/releases/download/v0.11.4/nvim-linux-x86_64.tar.gz
tar -xvzf nvim-linux-x86_64.tar.gz
sudo mkdir /usr/bin/nvim
sudo mv ./nvim-linux-x86_64/* /usr/bin/nvim

# Put backgrounds in proper directory
cp -r ./wallpapers ~/Pictures/

# Copy configurations to ~/.config
cp -r ./confs/* $HOME/.config/
cp -r theme-scripts $HOME
cp -r themes $HOME

# make configuration folders for dyn-wall-rs and hellwal
mkdir ~/.config/dyn-wall-rs
mkdir $HOME/.config/hellwal $HOME/.cache/hellwal/cache
# copy hellwal's templates to ~/.config
sudo cp -r /usr/share/docs/hellwal/templates $HOME/.config/hellwal

echo "theme1:light" > $HOME/Theme.txt

cp wofi_change_theme.sh ~

# Put nvim in path
echo 'export PATH=$PATH:/usr/bin/nvim/bin/' >> ~/.bashrc

# Always run fastfetch on every terminal you open
# You can remove this if you want
echo "fastfetch" >> ~/.bashrc

# Enable bluetooth in case it is not enabled
sudo systemctl enable bluetooth
sudo systemctl start bluetooth

# Delete directories cloned from git repos
rm -rf ./nvim-linux-x86_64* ./yay

systemctl reboot