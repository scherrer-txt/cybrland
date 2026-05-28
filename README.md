<img src="https://raw.githubusercontent.com/cybrcore/cybrcore/refs/heads/main/assets/repo-banners/cybrdots-banner-top.png"/>

<p align="center">
  <a href="https://stand-with-ukraine.pp.ua/">
    <img alt="standwithukraine" src="https://img.shields.io/badge/Support-Ukraine-FFC93C?style=flat-square&labelColor=07689F">
  </a>
</p>

# cybrdots
> [!NOTE]
> **Lucid dotfiles for Arch Linux**  
> Daily driven on Arch + Hyprland as a whole, individual themes should work anywhere  
> 
> **Version:** v2.0.0  
> **Status:** Stable (2026-04-08)  

> ![WARNING]  
> hyprland is in the process of switching from hyprlang to lua language. This config won't work as intended with newer versions (v0.55.0+). Last compatible version of hyprland is v0.54.3 from 2026-03-27. I will either wait a month until the new lua-based hyprland is stable or switch to something more stable in itself, I can't be bothered.  

<table>
  <tr>
    <td span><a href="INSTALL.md"><img alt="Install Guide" src="https://raw.githubusercontent.com/cybrcore/cybrcore/refs/heads/main/assets/buttons/button-install-guide.png" height=40px></a>
    <td><a href="https://github.com/cybrcore/cybrcore/blob/main/roadmap.md"><img alt="Roadmap" src="https://raw.githubusercontent.com/cybrcore/cybrcore/refs/heads/main/assets/buttons/button-roadmap.png" height=40px></a>
  </tr>
  <tr>
    <td><a href="https://github.com/cybrcore/cybrcore/blob/main/design-specification.md"><img alt="Design Specification" src="https://raw.githubusercontent.com/cybrcore/cybrcore/refs/heads/main/assets/buttons/button-design-specs.png" height=40px></a>
    <td><a href="https://github.com/cybrcore/cybrcore/blob/main/design-philosophy.md"><img alt="Design Philosophy" src="https://raw.githubusercontent.com/cybrcore/cybrcore/refs/heads/main/assets/buttons/button-design-philosophy.png" height=40px></a>
  </tr>
  <tr>
    <td><a href="https://github.com/cybrcore/cybrcore/blob/main/ai-disclosure.md"><img alt="AI Disclosure" src="https://raw.githubusercontent.com/cybrcore/cybrcore/refs/heads/main/assets/buttons/button-ai-disclosure.png" height=40px></a>
    <td><a href="https://github.com/cybrcore/cybrcore/blob/main/CONTRIBUTING.md"><img alt="Contributing" src="https://raw.githubusercontent.com/cybrcore/cybrcore/refs/heads/main/assets/buttons/button-contributing.png" height=40px></a>
  </tr>
</table>

## Content
- [What's Inside](#whats-inside)
- [Showcase](#showcase)
- [Themes](#themes)
- [Related Projects](#related-projects)
- [Credits & Inspiration](#credits--inspiration)

## What's Inside
- **Unified aesthetic** -- Lucid color palette ([cybrcolors](https://github.com/cybrcore/cybrcolors)) + 12 hand-crafted wallpapers ([cybrpapers](https://github.com/cybrcore/cybrpapers))  
- **Theme collection** -- Custom themes for 20+ applications  
- **Terminal-centric workflow** -- Fast, integrated TUI/CLI tools  
- **Modular by design** -- Use the full setup or cherry-pick individual themes  
- **Beginner-friendly docs** (WIP) -- Step-by-step guides with explanations + advanced patterns for power users  

## Showcase
<img src="https://raw.githubusercontent.com/cybrcore/cybrcore/refs/heads/main/assets/showcase/cybr-hyprland-hero1.png">
<p align="center">
  <em>Left-to-right: Neovim, rofi-launcher, cava, fastfetch, custom script ↗</em>
</p>
<br>
<img src="https://raw.githubusercontent.com/cybrcore/cybrcore/refs/heads/main/assets/showcase/cybr-hyprland-hero2.png">
<p align="center">
  <em>Left-to-right: stacked micro, yazi, broot ↗</em>
</p>
<br>
<img src="https://raw.githubusercontent.com/cybrcore/cybrcore/refs/heads/main/assets/showcase/cybr-hyprland-hero3.png">
<p align="center">
  <em>Firefox w/Cybrspace.online custom theme ↗</em>
</p>
<br>
<img src="https://raw.githubusercontent.com/cybrcore/cybrcore/refs/heads/main/assets/showcase/cybr-hyprland-hero4.png">
<p align="center">
  <em>Left-to-right: clock, btop, ls ↗</em>
</p>
<br>
<img src="https://raw.githubusercontent.com/cybrcore/cybrcore/refs/heads/main/assets/showcase/cybr-hyprland-hero5.png">
<p align="center">
  <em>Fore-to-back: wallpaper selector, neovim, matrix ↗</em>
</p>
<br>
<img src="https://raw.githubusercontent.com/cybrcore/cybrcore/refs/heads/main/assets/showcase/cybr-firefox-all.png">
<p align="center">
  <em>Firefox w/Sidebery ↗</em>
</p>
<img src="https://raw.githubusercontent.com/cybrcore/cybrcore/refs/heads/main/assets/showcase/cybr-swaync.png">
<p align="center">
  <em>swaync ↗ (floating notifications; control center; control center list)</em>
</p>

## Themes
### Core System
- **cybrdots** -- Lucid dotfiles for Arch Linux (you are here)
- **[cybr-hyprland](https://github.com/cybrcore/cybr-hyprland)** -- Tiling window manager
- **[cybr-kitty](https://github.com/cybrcore/cybr-kitty)** -- Terminal emulator
- **[cybr-fish](https://github.com/cybrcore/cybr-fish)** -- User-friendly shell
- **[cybr-waybar](https://github.com/cybrcore/cybr-waybar)** -- Status bar with custom modules
- **[cybr-rofi](https://github.com/cybrcore/cybr-rofi)** -- Application launcher & menus
- **[cybr-swaync](https://github.com/cybrcore/cybr-swaync)** -- Notification daemon
- **[cybr-starship](https://github.com/cybrcore/cybr-starship)** -- Cross-shell prompt

### Utilities
- **[cybr-obsidian](https://github.com/cybrcore/cybr-obsidian)** -- GUI Note-taking app
- **[cybr-btop](https://github.com/cybrcore/cybr-btop)** -- TUI System resource monitor
- **[cybr-yazi](https://github.com/cybrcore/cybr-yazi)** -- TUI Terminal file manager
- **[cybr-broot](https://github.com/cybrcore/cybr-broot)** -- CLI Directory navigator
- **[cybr-fzf](https://github.com/cybrcore/cybr-fzf)** -- CLI Fuzzy finder
- **[cybr-micro](https://github.com/cybrcore/cybr-micro)** -- TUI Lightweight text editor
- **[cybr-cava](https://github.com/cybrcore/cybr-cava)** -- CLI Audio visualizer
- **[cybr-bat](https://github.com/cybrcore/cybr-bat)** -- CLI Syntax-highlighted file viewer 
- **[cybr-fastfetch](https://github.com/cybrcore/cybr-fastfetch)** -- CLI System information tool  
- **[cybr-newsboat](https://github.com/cybrcore/cybr-newsboat)** -- CLI RSS/Atom reader

### UserStyles
- **[cybr-cyberspace.online](https://github.com/cybrcore/cybr-cyberspace.online)** -- A mystery

### WIP
- **[cybr-neovim](https://github.com/cybrcore/cybr-nvim)** -- Fully themed, polishing  
- **[cybr-firefox](https://github.com/cybrcore/cybr-firefox)** -- Fully themed, major refactor planned  
- **[cybr-gtk](https://github.com/cybrcore/cybr-gtk)** -- Early stage  
- **cybr-vscode** -- Partially themed (*Unreleased*)  
- **cybrcursors** -- Fully themed, polishing (*Unreleased*, [preview](https://8upload.com/image/d91ecbad191c4ec9/image_3.jpg))  

## Related `cybrcore` Projects
- [cybrcolors](https://github.com/cybrcore/cybrcolors) -- Custom color palette  
- [cybrpapers](https://github.com/cybrcore/cybrpapers) -- Wallpaper collection  
- [cybrcore](https://github.com/cybrcore/cybrcore) -- The source  

## Credits & Inspiration
This project builds on the work of many talented creators:

**Dotfile foundations:**
- [Matt-FTW/dotfiles](https://github.com/Matt-FTW/dotfiles) -- Many of Hyprland configs (*keybinds, scripts*) are based on their dotfiles  

**Theming & aesthetics:**
- [Catppuccin](https://github.com/catppuccin/catppuccin) -- This project showed me what's possible with themes, it's overall scope is inspiration and aspiration at the same time
- [Cyberpunk 2077 UI Bible](https://www.behance.net/gallery/118663901/Cyberpunk-2077User-Interface-(Part-1)) -- Endless source of inspiration and ideas (s/o [Vladimír Vilimovský](https://www.behance.net/vladimirvilimovsky), [Jakub Knapik](https://www.linkedin.com/in/jakub-knapik-56741931), [Robert Bielecki](http://robertbielecki.com/), [Imanol Delago Salazar](https://www.artstation.com/artwork/WKzrBG), [Marcin Stepien](https://www.artstation.com/artwork/GaVGaz), [Simon Besombes](https://www.artstation.com/artwork/285r4a), [Kamil Piotrowski](https://www.artstation.com/artwork/285lYa), [Zuzanna Dabrowa](https://www.artstation.com/artwork/d8RnZ1), [Wojciech Chalinski](https://www.artstation.com/artwork/2855DY), [Pawel Matuszak](https://www.artstation.com/artwork/NxeNDN), [Mateusz Walus](https://www.artstation.com/artwork/5X4OLO) and the army of unnamed and uncredited from CD Projekt RED, who made Cyberpunk 2077 possible)
- tonsky's [Minimalist Syntax Highlight philosophy](https://tonsky.me/blog/syntax-highlighting/) -- This is what I think is optimal and ideal syntax highlighting; inspiration for upcoming system-wide highlighting unification

**Community:**
- [r/unixporn](https://reddit.com/r/unixporn) -- Their [feedback](https://www.reddit.com/r/unixporn/comments/1ouzvfy/hyprland_cybrland_v010/) was the biggest impulse for me to release the dotfiles.
- [Cyberspace.online](https://cyberspace.online) -- Absolutely great community where I found my digital home after many years of wandering and lurking. Their support was of immensely important to keep me going.

If I missed anyone, feel free to open an issue!
