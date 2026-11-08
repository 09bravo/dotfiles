#!/bin/bash
set -e

BOLD=$(tput bold)
RED=$'\033[0;31m'
GREEN=$'\033[0;32m'
NC=$'\033[0m' # No Color

printf '%s%sTHIS SCRIPT WILL REPLACE YOUR SWAY CONFIG AND OTHERS.%s \nThe script will backup your config but I take no responsibility if your config is damaged in any way. In other words it is a good idea to backup yourself too before installing.\n\n' "$RED" "$BOLD" "$NC"
printf 'Continue? [%sy%s/%sn%s] ' "$GREEN" "$NC" "$RED" "$NC"
read -r continue

if [[ "$continue" != "y" && "$continue" != "Y" ]]; then
	printf '%s%sBye!%s\n' "$GREEN" "$BOLD" "$NC" 
	exit 0
fi

arch_packages="hicolor-icon-theme wl-clipboard neovim grim flameshot ttf-dejavu noto-fonts noto-fonts-emoji noto-fonts-cjk swaybg sway foot ttf-nerd-fonts-symbols ttf-fira-code wofi autotiling-rs xdg-desktop-portal-wlr xorg-xwayland xdg-desktop-portal-gtk rust cargo curl xz"

void_packages="hicolor-icon-theme wl-clipboard neovim grim flameshot noto-fonts-ttf noto-fonts-emoji noto-fonts-cjk swaybg sway foot nerd-fonts-symbols-ttf font-firacode wofi xdg-desktop-portal-wlr xorg-server-xwayland xdg-desktop-portal-gtk rust cargo curl xz"

# Name taken from blender source code FYI
privilege_escalation_tool=""

if command -v sudo &>/dev/null; then
	privilege_escalation_tool="sudo"
elif command -v doas &>/dev/null; then
	privilege_escalation_tool="doas"
else
	printf '%s%sError: Neither sudo or doas appear to be installed.%s\n' "$RED" "$BOLD" "$NC"
	exit 1
fi

source /etc/os-release

case "$NAME" in
"Arch Linux" | "Artix Linux" | "CachyOS Linux" | "EndeavourOS")
	"$privilege_escalation_tool" pacman -Sy --needed "$arch_packages"
	;;
"Void")
	"$privilege_escalation_tool" xbps-install -S "$void_packages"
	cargo install --git https://github.com/ammgws/autotiling-rs
	;;
*)
	printf "unsupported distro: %s\n" "$NAME"
	;;
esac

mkdir -p ~/.config
printf '%s%sTHIS WILL DELETE EXISTING BACKUPS (e.g ~/.config/sway.bak)%s\n' "$RED" "$BOLD" "$NC"
printf '%s%sDo you want to backup your current config for Sway, Foot and Wofi?%s [%sy%s/%sn%s]' "$RED" "$BOLD" "$NC" "$GREEN" "$NC" "$RED" "$NC"
read -r backup
if [[ $backup == "y" || $backup == "Y" ]]; then
	for dir in sway foot wofi; do
		if [[ -d ~/.config/"$dir" ]]; then
			cp -r ~/.config/"$dir" ~/.config/"$dir".bak
		fi
	done
else
	printf "%s%sYOU ANSWERED $backup AND THEREFORE YOUR CONFIG IS GOING TO BE OVERWRITTEN, YOU HAVE ONLY 5 SECONDS TO CANCEL THE SCRIPT USING Ctrl-C%s\n" "$RED" "$BOLD" "$NC"
	for _ in {1..5}; do
		printf "."
		sleep 1
	done
fi

cp -r sway/ foot/ wofi/ ~/.config/
cp -r wall-e ~/

cd ~/.local/share/icons
curl -LOs https://github.com/rose-pine/cursors/releases/download/v1.1.0/BreezeX-RosePine-Linux.tar.xz
rm -Rf BreezeX-RosePine-Linux.tar.xz

printf 'The script will move another script called startw, I will explain what is it later, but before I move it I want to ask a question. Do you use nvidia proprietary drivers? If that is the case sway needs to be started with the --unsupported-gpu flag [%sy%s/%sn%s]' "$GREEN" "$NC" "$RED" "$NC"
read -r proprietary_drivers
if [[ $proprietary_drivers == "y" || $proprietary_drivers == "Y" ]]; then
	$privilege_escalation_tool cp startw-nvidia /bin/startw
else
	$privilege_escalation_tool cp startw /bin/startw
fi

printf 'Finished!\nYou should now start sway with startw.\nstartw is a simple script which adds some environment variables and starts sway with D-Bus.\nMake sure D-Bus is installed and enabled [%sy%s/%sn%s]\n' "$GREEN" "$NC" "$RED" "$NC"

printf '%sDo you want to install my minimal neovim config?%s [%sy%s/%sn%s]\n' "$BOLD" "$NC" "$GREEN" "$NC" "$RED" "$NC"
