# Dotfiles

Personal configuration files for a Niri-based Wayland desktop environment with Custom theme.

![](./screenshots/Screenshots%20from%202025-09-25%2004-05-13.png)
![](./screenshots/Screenshots%20from%202025-09-25%2004-02-53.png)
![](./screenshots/Screenshots%20from%202025-09-25%2004-02-59.png)
![](./screenshots/Screenshots%20from%202025-09-25%2004-03-55.png)

## Setup

- **WM**: [Niri](https://github.com/YaLTeR/niri) - Scrollable tiling compositor
- **Bar**: Waybar with custom modules
- **Launcher**: Fuzzel
- **Terminal**: Ghostty / Alacritty
- **Editor**: Helix / Neovim
- **Multiplexer**: Tmux / Zellij
- **Shell**: Fish

## Niri Features

### Display Configuration
- Multi-monitor support (eDP-1 laptop, HDMI-A-1 external)
- 1.5x scaling on 4K display
- Custom output positioning

### Input
- Touchpad with natural scrolling, tap-to-click
- Mouse with natural scroll
- Keyboard shortcuts using Super/Mod keys

### Window Management
- Scrollable tiling layout with configurable gaps (16px)
- Focus borders (Meliora theme colors)
- Window rules for floating apps (Pavucontrol, file choosers)
- Animations for window open/close

### Key Bindings
- **Super+Return**: Terminal
- **Super+D**: Fuzzel launcher
- **Super+Q**: Close window
- **Super+[H/J/K/L]**: Focus movement
- **Super+Shift+[H/J/K/L]**: Window movement
- **Super+[1-9]**: Workspace switching
- **Super+Alt+L**: Lock screen (swaylock)
- **Mod+Shift+P**: Screenshot
- **Mod+Ctrl+Shift+[R/P]**: Reboot/Poweroff

### Startup Services
- Waybar (status bar)
- Swaybg (wallpaper)
- Swayidle (idle management with auto-lock)

### Scripts
- Power management (idle timers, power profiles)
- Keyboard backlight control
- Screen locking with swaylock
- Confirmation dialogs for system actions

## Custom Fish Functions

### WiFi Connection Helper
The `ctw` (connect to wifi) function simplifies WiFi connections:
```fish
# Connect to WiFi network
ctw <network-name>
```
This uses nmcli with automatic password prompting.

## Installation

```bash
# Clone repository
git clone <repo-url> ~/repo/dotfiles

# Run installation script (Fedora)
cd ~/repo/dotfiles
./install.sh

# Or manually symlink configs
ln -s ~/repo/dotfiles/.config/* ~/.config/
ln -s ~/repo/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/repo/dotfiles/.tmux ~/.tmux
```

## Dependencies

Core packages needed:
- niri, waybar, fuzzel, swaylock, swayidle, swaybg
- ghostty/alacritty, helix/nvim, tmux/zellij
- fish, btop, lazygit
