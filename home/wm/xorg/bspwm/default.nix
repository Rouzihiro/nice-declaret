{ config, lib, pkgs, ... }:

{

    xsession.windowManager.bspwm = {
        enable = true;
        package = pkgs.bspwm;
        extraConfig = ''
padding=0
gap=5
border=2

#deadd-notification-center &
#compton --experimental-backends &
picom --experimental-backends &

nitrogen --restore

sxhkd &


polybar &


picom &



# MONITOR
bspc monitor HDMI-1 -d  I II III IV V
bspc monitor eDP-1 -d VI VII VIII IX X


# CUSTOM
bspc config focused_border_color  "#928374"
bspc config normal_border_color  "#1B1B1B"
bspc config border_width         $border
bspc config window_gap           $gap
bspc config split_ratio          0
bspc config borderless_monocle   true
bspc config gapless_monocle      false
bspc config single_monocle       true
bspc config focus_follows_pointer true
bspc config bottom_padding  $padding
bspc config top_padding     $padding
bspc config left_padding    $padding
bspc config right_padding   $padding
bspc config directional_focus_tightness low


# Remove x cursor
xsetroot -cursor_name left_ptr &


# Rules
bspc rule -a Gimp desktop='^8' state=floating follow=on
bspc rule -a Google-chrome desktop='^1'
bspc rule -a discord desktop='^4' follow=on
bspc rule -a obs desktop='^5' follow=on
bspc rule -a Thunar state=floating follow=on
bspc rule -a Nitrogen state=floating follow=on
bspc rule -a mpv state=floating follow=on
bspc rule -a Chromium desktop='^2'
bspc rule -a mplayer2 state=floating
bspc rule -a Kupfer.py focus=on
bspc rule -a Screenkey manage=off
bspc rule -a Pavucontrol state=floating rectangle 800x800 sticky=off
bspc rule -a ghost-chat state=floating border=off sticky=on


#enable touchpad tapping and natural scrolling
xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Tapping Enabled" 1
xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Natural Scrolling Enabled" 1


killall bspswallow
fipgrep -f /home/ravy/dotnix/home/wm/xorg/bspwm/swallow || /home/ravy/dotnix/home/wm/xorg/bspwm/bspswallow &
        '';
    };
    
    services.sxhkd = {
        enable = true;
        package = pkgs.sxhkd;
        extraConfig = ''
#
# wm independent hotkeys
#
super + shift + o: {equal,minus,o}
    picom-trans -c -o {+5,-5,100}

# browser
super + w
  google-chrome-stable

# file manager
super + e
  thunar

# terminal emulator
super + Return
	alacritty

# search rofi
super + space
  rofi -show drun

# color picker
super + z
    colorpicker --short --one-shot --preview | xsel -b

# make sxhkd reload its configuration files:
super + Escape
	pkill -USR1 -x sxhkd

super + shift + Escape
	pkill -KILL bspwm
#
# bspwm hotkeys
#

# quit/restart bspwm
super + alt + {q,r}
	bspc {quit,wm -r}

# close and kill
super + {_,shift + }q
	bspc node -{c,k}

# alternate between the tiled and monocle layout
super + m
	bspc desktop -l next

# send the newest marked node to the newest preselected node
super + y
	bspc node newest.marked.local -n newest.!automatic.local

# swap the current node and the biggest window
super + g
	bspc node -s biggest.window

#
# state/flags
#

# set the window state
super + {t,shift + t,s,f}
	bspc node -t {tiled,pseudo_tiled,floating,fullscreen}

# set the node flags
super + ctrl + {m,x,y,z}
	bspc node -g {marked,locked,sticky,private}

#
# focus/swap
#

# focus the node in the given direction
super + {_,shift + }{h,j,k,l}
	bspc node -{f,s} {west,south,north,east}

# focus the node for the given path jump
super + {p,b,comma,period}
	bspc node -f @{parent,brother,first,second}

# focus the next/previous window in the current desktop
super + {_,shift + }c
	bspc node -f {next,prev}.local.!hidden.window

# focus the next/previous desktop in the current monitor
super + bracket{left,right}
	bspc desktop -f {prev,next}.local

# focus the last node/desktop
super + {Tab,Tab}
	bspc {node,desktop} -f last

# focus the older or newer node in the focus history
super + {o,i}
	bspc wm -h off; \
	bspc node {older,newer} -f; \
	bspc wm -h on


super + {_,shift + }{1-9,0}
	bspc {desktop -f,node -d} '^{1-9,10}'

#
# preselect
#

# preselect the direction
super + shift + {h,j,k,l}
	bspc node -p {west,south,north,east}


# cancel the preselection for the focused node
super + space
	bspc node -p cancel

# cancel the preselection for the focused desktop
super + ctrl + shift + space
	bspc query -N -d | xargs -I id -n 1 bspc node id -p cancel

#
# move/resize
#

# expand a window by moving one of its side outward
ctrl + super + {h,j,k,l}
	bspc node -z {left -20 0,bottom 0 20,top 0 -20,right 20 0}

# contract a window by moving one of its side inward
ctrl + super + shift + {h,j,k,l}
	bspc node -z {right -20 0,top 0 20,bottom 0 -20,left 20 0}

# move a floating window
super + {Left,Down,Up,Right}
	bspc node -v {-20 0,0 20,0 -20,20 0}

##CUSTOM

#printscreen
Print
	flameshot full -c -p ~/Pictures/Screenshots

Print + shift
  flameshot gui

#volume control
XF86AudioRaiseVolume
	amixer set 'Master' 5%+

XF86AudioLowerVolume
	amixer set 'Master' 5%-

XF86AudioMute
	amixer set Master toggle

#brightnessctl

XF86MonBrightnessUp
	brightnessctl set 5%+

XF86MonBrightnessDown	
	brightnessctl set 5%-
        '';
    };
		

	home.packages = with pkgs; [
		polybar
		picom
		nitrogen
		xorg.xrandr
		pavucontrol
		eww
		xorg.xinit
		feh
		killall
	];
}
