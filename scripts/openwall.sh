#!/usr/bin/env bash

if [ -z "$1" ]; then
    echo "No file specified."
    exit 1
fi

# Kill any existing swaybg instances
pkill swaybg

# Set the new wallpaper
swaybg -i "$1" -m fill &

