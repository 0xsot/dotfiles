#!/bin/bash

# Dotfiles Installation Script for Fedora

set -e

# Update system
sudo dnf update -y

# Add COPR for niri
sudo dnf copr enable -y yalter/niri

# Install packages
sudo dnf install -y \
    niri \
    waybar \
    fuzzel \
    swaylock \
    swayidle \
    swaybg \
    wl-clipboard \
    xdg-desktop-portal-gtk \
    xdg-desktop-portal-wlr \
    fish \
    alacritty \
    tmux \
    zellij \
    helix \
    neovim \
    git \
    lazygit \
    ripgrep \
    fd-find \
    bat \
    eza \
    btop \
    brightnessctl \
    light \
    pavucontrol \
    nm-applet \
    dunst \
    jetbrains-mono-fonts \
    fontawesome-fonts \
    google-noto-emoji-fonts

# Create directories
mkdir -p ~/.config
mkdir -p ~/Pictures/Screenshots

# Backup existing configs
BACKUP_DIR=~/.config-backup-$(date +%Y%m%d-%H%M%S)
for dir in niri waybar fuzzel wlogout btop fish ghostty alacritty helix nvim zellij lazygit git; do
    if [ -e ~/.config/$dir ]; then
        mkdir -p $BACKUP_DIR
        mv ~/.config/$dir $BACKUP_DIR/
    fi
done

# Symlink configs
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for config in niri waybar fuzzel wlogout btop fish ghostty alacritty helix nvim zellij lazygit git; do
    if [ -d "$DOTFILES_DIR/$config" ]; then
        ln -sf "$DOTFILES_DIR/$config" ~/.config/
    fi
done

# Symlink tmux
[ -f "$DOTFILES_DIR/.tmux.conf" ] && ln -sf "$DOTFILES_DIR/.tmux.conf" ~/
[ -d "$DOTFILES_DIR/.tmux" ] && ln -sf "$DOTFILES_DIR/.tmux" ~/

# Set fish as default shell
echo "$(which fish)" | sudo tee -a /etc/shells
chsh -s $(which fish)

# Install tmux plugin manager
[ ! -d ~/.tmux/plugins/tpm ] && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install Helix grammars
hx --grammar fetch
hx --grammar build

echo "Installation complete. Log out and select Niri from your display manager."