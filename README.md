# My dotfiles

These are the dotfiles for my Hyprland setup on Arch linux.
The repository has setup scripts that should work on any Arch instalation

## How to install

> [!WARNING] This tutorial assumes you made a desktop installation of Arch with Hyprland (you can do this in `archinstall`)
>
> if you selected another environment or have a minimal installation (in other words, have not installed anything yet), then run this first:
>
> ```sh
> sudo pacman -Syu # Always update first
>
> # Install the basics
> sudo pacman -S dolphin grim hyprland polkit-kde-agent qt5-wayland qt6-wayland slurp wofi xdg-desktop-portal-hyprland
> ```
>
> Now you're ready to start

```sh
# Copy directory
git clone https://github.com/vitor-luis3301/dotfiles_ou_sla

# Make all scripts inside folder executable
find dotfiles_ou_sla -type f -iname "*.sh" -exec chmod +x {} \;

# enter directory
cd dotfiles_ou_sla
```

You have two options from now: run `setup.sh` or `setup_minimal.sh`

The only real difference between these two is that `setup.sh` also installs the apps I daily drive (Like Zen browser, Steam, Obsidian) as flatpaks,
adds Lazyvim with Neovim, and adds a lot of themes for SDDM (which I use)

If you don't use SDDM, or don't want to have all of these apps installed, you can run `setup_minimal.sh` no problem.

So in summary

|                    |    `setup.sh`    |`setup_minimal.sh`|
|--------------------|------------------|------------------|
|Essential packages  |:white_check_mark:|:white_check_mark:|
|Neovim              |:white_check_mark:|:white_check_mark:|
|Config files        |:white_check_mark:|:white_check_mark:|
|yay                 |:white_check_mark:|:white_check_mark:|
|Zen browser         |:white_check_mark:|        :x:       |
|Ollama              |:white_check_mark:|        :x:       |
|Steam, heroic, Sober|:white_check_mark:|        :x:       |
|LazyVim             |:white_check_mark:|        :x:       |
|SDDM themes         |:white_check_mark:|        :x:       |

You can easily just install any of these other apps afterwards if you really need to later.

Whatever option you choose, what they are going to do is install all libraries and apps needed for the system to work properly, and then copy all the folders in `confs` to `~/.config`

## What you'll get after

### wofi

*insert gif showing wofi working*

### dynamic themes

*insert gif showing this*

To make your own, make a text file inside ~/themes.

There's 3 options for themes:

1. **Static theme:** Just an image

```txt
/home/user/Pictures/wallpapers/frieren1.jpg
```

> [!NOTE] Always use absolute paths for all types

2. **Dynamic color-based theme:** Different image for light or dark mode

```txt
type:dynamic-color
dark=/home/user/Pictures/wallpapers/zorin/dark.jpg
light=/home/user/Pictures/wallpapers/zorin/light.jpg
```

3. **Dynamic time-based theme:** Different image based on clock time

```txt
type:dynamic-time
times = [
  "00:00",
  "06:00",
  "12:00",
  "18:00",
  "22:00",
] # If you wan't the times to be automatic, just don't add this variable
directory = "/home/user/Pictures/wallpapers/lakeside/" 
```

To select what theme you want to use, hit `SUPER`+`H`. This will open Wofi listing all files in `~/themes`

*insert gif here*

When you select it, it will be applied. It might take a while, but it works

*insert gif of it working*

Waybar, Hyprland's window borders are all synced with the current background using [Hellwal](https://github.com/danihek/hellwal). This means that they change when you change themes or when you select dark or light mode

*insert gif of this right here*

*I'm tired of writing these*

### SDDM themes (if `setup.sh`)

All themes come from [This repository here](https://github.com/Keyitdev/sddm-astronaut-theme), so take a look there instead! (maybe even star them :star: just saying)

> Shoutout to **keyitdev** btw, these themes are fucking awesome! :+1:


## Credits to other projects

- [Hellwal](https://github.com/danihek/hellwal) (Generate color schemes from images)
- [dyn-wall-rs](https://github.com/rehanzo/dyn-wall-rs) (Dynamic wallpapers that change with time)
- [vicinae](https://github.com/vicinaehq/vicinae) (Raycast clone that I use along Wofi)
- [Linux dynamic wallpapers](https://github.com/saint-13/Linux_Dynamic_Wallpapers/) (Zorin backgrounds were pulled from there)
