#!/bin/bash

CONF_DIR="$HOME/.config"
LOCAL_DIR="$HOME/.local"
BASE_DIR="."

echo "󰄭 Starting Dotfiles Backup..."

mkdir -p "./.config"
mkdir -p "./.local/bin"

cp -rf "$CONF_DIR/hypr" "./.config/"
cp -rf "$CONF_DIR/waybar" "./.config/"
cp -rf "$CONF_DIR/kitty" "./.config/"
cp -rf "$CONF_DIR/wofi" "./.config/"
cp -rf "$CONF_DIR/eew" "./.config/"

cp -rf $LOCAL_DIR/bin/hyprland-per-window-layout ./.local/bin/

git add .

if git diff-index --quiet HEAD --; then
    echo "󰩈 No changes detected, skipping git push."
else
    git commit -m "Backup Date: $(date +'%Y-%m-%d %H:%M')"
    git push origin main
    echo "󰄬 Backup completed successfully."
fi