#!/usr/bin/env bash


DIR=$HOME/Wallpaper/
PICS=($(ls ${DIR}))

RANDOMPICS=${PICS[ $RANDOM % ${#PICS[@]} ]}


if [[ $(pidof swaybg) ]]; then
  pkill swaybg
fi

swww query || swww-daemon

if [ -z "$1" ]; then
    swww img ${DIR}/${RANDOMPICS} --transition-fps 30 --transition-type any --transition-duration 1
    exit 1
fi



swww img $1 --transition-fps 30 --transition-type any --transition-duration 1


