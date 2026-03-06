#!/bin/bash

CONF_DIR="$HOME/.config"
LOCAL_DIR="$HOME/.local"
BASE_DIR="."

echo "󰄭 Starting Dotfiles Backup..."

mkdir -p "$BASE_DIR/.config"
mkdir -p "$BASE_DIR/.local/bin"

cp -rf "$CONF_DIR/hypr" "$BASE_DIR/.config/"
cp -rf "$CONF_DIR/waybar" "$BASE_DIR/.config/"
cp -rf "$CONF_DIR/kitty" "$BASE_DIR/.config/"
cp -rf "$CONF_DIR/wofi" "$BASE_DIR/.config/"

cp -rf $LOCAL_DIR/bin/hyprland-per-window-layout $BASE_DIR/.local/bin/

git add .

if git diff-index --quiet HEAD --; then
    echo "󰩈 No changes detected, skipping git push."
else
    git commit -m "Backup Date: $(date +'%Y-%m-%d %H:%M')"
    git push origin main
    echo "󰄬 Backup completed successfully."
fi