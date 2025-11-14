![Hyprland banner](../assets/hyprland.png)

# Cybrland (WIP)
Theme for Hyprland window manager inspired by the color palette popularized by **Cyberpunk 2077**.

> [!CAUTION]
> This theme is still work in progress and was not made with other users in mind. 

## Result
<img src="../assets/inspiration/insp-colors.png" width="800"/></td>

## What to do
### 1. Install `GeistMono Nerd Font` ([from here](https://www.nerdfonts.com/font-downloads))

### 2. Download `hyprland.conf`, `theme.conf` and `vars.conf`
  - `hyprland.conf` contains all **functional** setting, and is linked to`theme.conf`
  - `theme.conf` contains all **decorations**, and is linked to `vars.conf`
  - `vars.conf` contains all **variables** (*colors, gaps, font, blur etc.*)

### 3. File structure should look like this
```code
hypr/
  hyprland.conf
  theme/
    theme.conf
    vars.conf
```
### 4. Create a backup of your old config and theme

## Random wallpaper (WIP)
> This script cycles wallpapers in a pseudo-random pattern (never shows the same wallpaper twice in a row, hence pseudo-random).

### 1. Copy [random_wallpaper](../hyprland/scripts/random_wallpaper) script inside your hypr/script folder

### 2. Make it executable
```sh
chmod +x ~/.config/hypr/scripts/random_wallpaper
```

### 3. Create a service

```sh
micro ~/.config/systemd/user/random-wallpaper.service
```

### 4. Paste inside

```toml
[Unit]
Description=Change wallpaper randomly using hyprpaper
After=hyprpaper.service graphical-session.target
Requires=hyprpaper.service
PartOf=hypr-session.target

[Service]
Type=oneshot
ExecStart=%h/.config/hypr/scripts/random_wallpaper

[Install]
WantedBy=hypr-session.target
```

### 5. Create a timer

```sh
micro ~/.config/systemd/user/random-wallpaper.timer
```

### 6. Paste inside

```toml
[Unit]
Description=Periodic random wallpaper change
PartOf=hypr-session.target

[Timer]
OnBootSec=2s
OnUnitActiveSec=15m
Unit=random-wallpaper.service
Persistent=true

[Install]
WantedBy=hypr-session.target
```

### 7. Run

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
