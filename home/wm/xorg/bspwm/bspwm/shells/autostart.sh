cd $HOME/.config/bspwm/shells

# this for monitors
./screenlayout.sh &

# this for keyboard layout
./keyboard.sh &

# this for wallpapers
./background.sh &

# this for keyboard view
# killall screenkey
# screenkey &

# this for transparency/opacity
killall picom
picom &

# use mouse not keyboard
# killall warpd
# warpd &

# of not work light command try this command
# [[ sudo chmod +s /usr/bin/light ]]
# light -S 0 &
