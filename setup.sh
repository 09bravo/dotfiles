#!/bin/bash
set -e

echo "This script assumes that this is a fresh install of Arch/Artix based Distros."
read -rp "Continue? [y/n] " answer
if [ "$answer" != "y" ]; then
	echo "Bye!"
	exit 0
fi

packages="grim flameshot ttf-dejavu noto-fonts noto-fonts-emoji noto-fonts-cjk swaybg sway foot ttf-nerd-fonts-symbols ttf-fira-code wofi autotiling-rs xdg-desktop-portal-wlr xorg-xwayland xdg-desktop-portal-gtk"
if command -v sudo &>/dev/null; then
	sudo pacman -S --needed $packages
	sudo cp startw /bin/startw
elif command -v doas &>/dev/null; then
	doas pacman -S --needed $packages
	doas cp startw /bin/startw
else
	su -c "pacman -S --needed $packages"
	su -c "cp startw /bin/startw"
fi

mkdir -p ~/.config
cp -r flameshot sway/ foot/ wofi/ ~/.config/
cp -r wall-e ~/
printf "Finished!\nYou should now start sway with startw.\nstartw is a simple script which adds some environment variables and starts sway with D-Bus.\nMake sure D-Bus is installed and enabled.\n"
