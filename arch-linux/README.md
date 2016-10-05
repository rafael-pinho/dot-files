#Arch Linux

## Configuration and Software Installation

#### [Post-Install Configuration](./post-install-config.sh)

Script created to help during arch linux installation. All steps is based on archlinux wiki tutorials. For more info about arch-linux install see:

- https://wiki.archlinux.org/index.php/Beginners'_guide
- https://wiki.archlinux.org/index.php/Beginners'_guide_(Português)
<br>
<br>

#### [Software Installer](./software-installer.sh)

Install software to common use, development and other thinks. 

- Browsers
 - Opera
 - Google Chrome
 - Firefox
- File Managers
 - Ranger
 - Nautilus
- Music Player
 - Spotify 
- Wallpaper Managers
 - Feh
 - Nitrogen
- SSH client
- NVM - Node Version Manager
- Container management
 - Docker
 - Docker-Compose
- Tools
 - wget
 - zip
 - unzip
 - git
 - dosfstools
<br>
<br>

#### [Reset Installation](./reset-install.sh)

Remove all and leave only base and base-devel packages. 
<br>
<br>

## [Window Managers and Desktop Environments](./environments)

####[i3-wm](./environments/i3)

Install i3 window manager with i3status, i3lock and dmenu. Also change xinitrc to start i3 when startx is called. 
Have some configuration files to i3 and i3status too.

####[Gnome](./environments/gnome)

Install gnome with numix theme
<br>
<br>

## [My Packages](./packages)

The current instaled packages in my arch linux system.

- [pacman](./packages/pacman.sh)
- [yaourt](./packages/yaourt.sh)
