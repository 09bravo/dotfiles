#!/bin/bash
su -c 'pacman -S swaybg sway foot ttf-nerd-fonts-symbols ttf-fira-code wofi autotiling-rs xdg-desktop-portal-wlr'
rm -Rf wall-e/sources.txt
mkdir -p ~/.config
mv sway/ foot/ wofi/ ~/.config/
mv wall-e ~/
