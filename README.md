# dotfiles
The Sway dotfiles I use. It is really minimal and lightweight, it does not use anything fancy like WayBar, but at the same time it uses wofi instead of dmenu, so it is balanced between lightweightness and looks.

# Usage
Run ```./installer.sh``` which is an automatic installer for the dotfiles. 
The script supports both ```sudo``` and ```doas```

# Supported Distributions
- Arch Linux
- Artix Linux
- Void Linux
- CachyOS
- EndeavourOS

# Q&A

- Q: Why doesn't the config use WayBar?
- A: If I remember correctly, WayBar consume around 30-40mb of ram, which might not sound like, however in my old laptop (when I originally made the config) had 4gb of ram, and I wanted to squeeze every bit of ram I have to the browser or games (games like half-life 1 & 2 and portal 1 & 2). Now I no longer have that laptop but the mindset of making my PC and OS as lightweight as possible still stuck with me.

> Nothing against WayBar it is really cool, it is just that I'm a performance freak.

# Monitors 
Please modify the monitor lines as they assume that your monitor is connected via HDMI and is named exactly HDMI-A-1 and that it is a 1080p 100hz monitor.

There is also lines for TV mirroring if you want that (but again, modify the names).
I'll make a script that will automatically detect your monitor(s) and uses the correct refresh rate, but that'll be coming soon™.

# Adding and removing wallpapers
Wallpapers are in the ```wall-e``` directory. The config only loads wallpapers listed in the ```list.txt``` because it does save a bit  of performance if you save the names in a file instead of listing them with find (like the config did before), and therefore if you add any new wallpapers edit the list.txt file and optionally the sources.txt file too (if you are going to make a PR).
