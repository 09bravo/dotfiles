if command -v sudo &>/dev/null
then
sudo pacman -S grim flameshot ttf-dejavu swaybg sway foot ttf-nerd-fonts-symbols ttf-fira-code wofi autotiling-rs xdg-desktop-portal-wlr
else
su -c 'pacman -S grim flameshot ttf-dejavu swaybg sway foot ttf-nerd-fonts-symbols ttf-fira-code wofi autotiling-rs xdg-desktop-portal-wlr'
fi
mkdir -p ~/.config
cp flameshot sway/ foot/ wofi/ ~/.config/
cp wall-e ~/
rm -Rf ~/wall-e/sources.txt
