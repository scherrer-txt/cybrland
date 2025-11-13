![Hyprland banner](../assets/hyprland.png)

# Cybrland (WIP)
Theme for Hyprland window manager inspired by the color palette popularized by **Cyberpunk 2077**.

> [!CAUTION]
> This theme is still work in progress and was not made with other users in mind. 

## Result
<img src="../assets/inspiration/insp-colors.png" width="800"/></td>

## What to do
### Install `GeistMono Nerd Font` ([from here](https://www.nerdfonts.com/font-downloads))

### Download `hyprland.conf`, `theme.conf` and `vars.conf`
  - `hyprland.conf` contains all **functional** setting, and is linked to`theme.conf`
  - `theme.conf` contains all **decorations**, and is linked to `vars.conf`
  - `vars.conf` contains all **variables** (*colors, gaps, font, blur etc.*)
### File structure should look like this
```code
hypr/
  hyprland.conf
  theme/
    theme.conf
    vars.conf
```
### Create a backup of your old config and theme

## Random wallpaper (WIP)
### Copy [random_wallpaper](../hyprland/scripts/random_wallpaper) script inside your hypr/script folder

### Make it executable
```sh
chmod +x ~/.config/hypr/scripts/random_wallpaper
```

### Create a service:

```sh
micro ~/.config/systemd/user/random-wallpaper.service
```

### Paste inside:

```toml
[Unit]
Description=Change wallpaper randomly using hyprpaper

[Service]
ExecStart=%h/.config/hypr/scripts/random_wallpaper
Type=oneshot
```

### Create a timer:

```sh
micro ~/.config/systemd/user/random-wallpaper.timer
```

### Paste inside:

```toml
[Unit]
Description=Periodic random wallpaper change

[Timer]
OnBootSec=1min
OnUnitActiveSec=15m
Persistent=true
Unit=random-wallpaper.service

[Install]
WantedBy=timers.target
```

### Run:

```sh
systemctl --user daemon-reload
systemctl --user enable --now random-wallpaper.timer
systemctl --user start random-wallpaper.service
systemctl --user status random-wallpaper.service
# Should show 'Active: inactive (dead)"
```

After any future changes to the script:

```sh
systemctl --user daemon-reload
```
