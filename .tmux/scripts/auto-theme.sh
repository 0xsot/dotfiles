#!/usr/bin/env bash

# Auto-detect macOS appearance and apply appropriate tmux theme

# Function to get current macOS appearance
get_macos_appearance() {
    if defaults read -g AppleInterfaceStyle 2>/dev/null | grep -q "Dark"; then
        echo "dark"
    else
        echo "light"
    fi
}

# Function to apply theme
apply_theme() {
    local theme="$1"
    local theme_file="$HOME/.tmux/themes/melange-${theme}.conf"
    
    if [ -f "$theme_file" ]; then
        tmux source-file "$theme_file"
        # Store current theme for reference
        echo "$theme" > "$HOME/.tmux/.current-theme"
        tmux display-message "Melange theme applied"
    else
        tmux display-message "Theme file not found: $theme_file"
    fi
}

# Function to toggle theme manually
toggle_theme() {
    if [ -f "$HOME/.tmux/.current-theme" ]; then
        current=$(cat "$HOME/.tmux/.current-theme")
        if [ "$current" = "dark" ]; then
            apply_theme "light"
        else
            apply_theme "dark"
        fi
    else
        # If no current theme stored, detect from system
        theme=$(get_macos_appearance)
        apply_theme "$theme"
    fi
}

# Main logic
if [ "$1" = "toggle" ]; then
    toggle_theme
else
    # Auto-detect and apply
    theme=$(get_macos_appearance)
    apply_theme "$theme"
fi