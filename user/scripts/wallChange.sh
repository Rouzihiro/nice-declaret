#!/usr/bin/env bash

DIR=$HOME/Pictures/wallpapers/
PICS=($(ls ${DIR}))

RANDOMPICS=${PICS[ $RANDOM % ${#PICS[@]} ]}

# if [[ $(pidof swaybg) ]]; then
#   pkill swaybg
# fi
#

if [ -z "$1" ]; then
    feh --randomize --bg-fill ${DIR}/$MYFILE
    exit 1
fi

echo "wall start"
echo $MYFILE
echo "wall end"
