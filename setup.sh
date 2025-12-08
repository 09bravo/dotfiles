#!/bin/bash
su -c 'pacman -S grim flameshot ttf-dejavu swaybg sway foot ttf-nerd-fonts-symbols ttf-fira-code wofi autotiling-rs xdg-desktop-portal-wlr'
rm -Rf wall-e/sources.txt
mkdir -p ~/.config
mv flameshot sway/ foot/ wofi/ ~/.config/
mv wall-e ~/
