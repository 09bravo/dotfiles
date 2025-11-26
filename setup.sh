#!/bin/bash
su -c 'pacman -S swaybg sway foot ttf-nerd-fonts-symbols ttf-fira-code dmenu'
su -c 'mv bin/* /bin/'
rm -Rf wall-e/sources.txt
mkdir -p ~/.config
mv sway/ foot/ ~/.config/
mv wall-e ~/
