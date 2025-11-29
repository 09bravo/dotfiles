#!/bin/bash
su -c 'pacman -S swaybg sway foot ttf-nerd-fonts-symbols ttf-fira-code dmenu autotiling-rs xdg-desktop-portal-wlr'
rm -Rf wall-e/sources.txt
mkdir -p ~/.config
mv sway/ foot/ ~/.config/
mv wall-e ~/
