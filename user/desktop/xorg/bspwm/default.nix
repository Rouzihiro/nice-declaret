{
  config,
  lib,
  pkgs,
  mySettings,
  ...
}: {
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
      bspc config normal_border_color  "#282828"
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
      fipgrep -f ${config.home.homeDirectory}/.dotnix/user/wm/xorg/bspwm/swallow || ${config.home.homeDirectory}/.dotnix/user/wm/xorg/bspwm/bspswallow &
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
        ${mySettings.user.browser}

      # file manager
      super + e
        thunar

      # terminal emulator
      super + Return
        ${mySettings.user.term}

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

  services.polybar = {
    enable = true;
    script = "polybar bar &";

    config = {
      "colors" = {
        background = "#00000000";
        background-alt = "#1A000000";
        foreground = "#70ebdbb2";
        foreground-active = "#fbf1c7";
        foreground-occupied = "#ebdbb2";
        foreground-dimmed = "#fbf1c7";
        primary = "#fbf1c7";
        secondary = "#8ABEB7";
        alert = "#a89984";
        disabled = "#665c54";
      };

      "bar/top" = {
        type = "internal/bspwm";
        width = "100%";
        height = "9pt";
        radius = "0";
        wm-restack = "bspwm";
        monitor = "\${env:MONITOR}";
        offset-x = "0";
        offset-y = "0";
        bottom = "true";
        label-monitor = "%name%";
        label-focused = "%name%";
        # dpi = 96
        background = "\${colors.background}";
        foreground = "\${colors.foreground}";
        line-size = "2pt";
        border-size = "2pt";
        border-color = "#00000000";
        padding-left = "0";
        padding-right = "1";
        module-margin = "1";
        separator = "|";
        separator-foreground = "\${colors.disabled}";
        font-0 = "Monaspace Krypton:size=9:style=Bold;2";
        font-1 = "Jetbrains Mono:size=9:style=Bold;2";
        font-2 = "CaskaydiaCove Nerd Font:size=9:style=Bold;2";
        modules-left = "xworkspaces bsplayout2 xwindow";
        modules-right = "cava pulseaudio pipewire xkeyboard filesystem memory cpu battery date";
        cursor-click = "pointer";
        cursor-scroll = "ns-resize";
        # enable-ipc = true
      };

      "module/xworkspaces" = {
        type = "internal/xworkspaces";
        label-active = "%name%";
        label-active-background = "\${colors.background-alt}";
        label-active-underline = "\${colors.primary}";
        label-active-padding = "2";
        label-active-foreground = "\${colors.foreground-active}";
        label-occupied = "%name%";
        label-occupied-padding = "2";
        label-occupied-foreground = "\${colors.foreground-occupied}";
        label-urgent = "%name%";
        # label-urgent-background = ${colors.alert}
        label-urgent-padding = "2";
        label-empty = "%name%";
        label-empty-foreground = "\${colors.disabled}";
        label-empty-padding = "2";
      };

      "module/bsplayout2" = {
        type = "custom/script";
        exec = "bspc query -T -d | grep -q '\"userLayout\":\"monocle\"' && echo M || echo \"\"";
        interval = "1";
      };

      "module/xwindow" = {
        type = "internal/xwindow";
        label = "%title:0:60:...%";
        label-foreground = "\${colors.foreground-dimmed}";
      };

      "module/filesystem" = {
        type = "internal/fs";
        interval = "25";
        mount-0 = "/";
        format-prefix-foreground = "\${colors.primary}";
        label-mounted = "󰋊 %{F#F0C674}%mountpoint%%{F-} %percentage_used%%";
        label-unmounted = "󰋊 %mountpoint% not mounted";
        label-unmounted-foreground = "\${colors.disabled}";
        click-right = "btop";
      };

      "module/cava" = {
        type = "custom/script";
        tail = "true";
        exec = "${config.home.homeDirectory}/.dotnix/user/wm/xorg/bspwm/cava.sh";
        # exec = cava -p $HOME/.config/polybar/cava.ini
        # format = hello
        format-font = "5";
        label = "%output%";
      };

      "module/pulseaudio" = {
        type = "internal/pulseaudio";
        # format-volume-prefix = "\"VOL \"";
        format-volume-prefix-foreground = "\${colors.primary}";
        # format-volume = "<label-volume>";
        # label-volume = "%percentage%%";
        # label-muted = "muted";
        label-muted-foreground = "\${colors.disabled}";

        use-ui-max = "true";
        interval = "5";
        reverse-scroll = "false";
        format-volume = "<ramp-volume> <label-volume>";
        label-muted = "🔇 muted";
        ramp-volume-0 = "🔈";
        ramp-volume-1 = "🔉";
        ramp-volume-2 = "🔊";
        click-right = "pavucontrol";
      };

      "module/pipewire" = {
        type = "custom/ipc";
        label = "%output%";
        label-font = "1";
        initial = "5";
        click-right = "exec pavucontrol &";
      };

      "module/xkeyboard" = {
        type = "internal/xkeyboard";
        blacklist-0 = "num lock";
        label-layout = "%layout%";
        label-layout-foreground = "\${colors.primary}";
        label-indicator-padding = "2";
        label-indicator-margin = "1";
        label-indicator-foreground = "\${colors.background}";
        label-indicator-background = "\${colors.secondary}";
      };

      "module/memory" = {
        type = "internal/memory";
        interval = "2";
        format-prefix = "\"󰆩  \"";
        format-prefix-foreground = "\${colors.primary}";
        label = "%percentage_used:2%%";
        click-right = "btop";
      };

      "module/cpu" = {
        type = "internal/cpu";
        interval = "2";
        format-prefix = "\"  \"";
        format-prefix-foreground = "\${colors.primary}";
        label = "%percentage:2%%";
        click-right = "btop";
      };

      "network-base" = {
        type = "internal/network";
        interval = "5";
        format-connected = "<label-connected>";
        format-disconnected = "<label-disconnected>";
        label-disconnected = "%{F#F0C674}%ifname%%{F#707880} disconnected";
      };

      "module/wlan" = {
        "inherit" = "network-base";
        interface-type = "wireless";
        label-connected = "%{F#F0C674}%ifname%%{F-} %essid% %local_ip%";
      };

      "module/eth" = {
        "inherit" = "network-base";
        interface-type = "wired";
        label-connected = "%{F#F0C674}%ifname%%{F-} %local_ip%";
      };

      "module/date" = {
        type = "internal/date";
        interval = "1";
        date = "%I:%M %p";
        date-alt = "%Y/%m/%d %H:%M:%S %p";
        label = "%date%";
        label-foreground = "\${colors.primary}";
      };

      "module/battery" = {
        type = "internal/battery";
        format-charging-foreground = "\${colors.primary}";
        format-discharging-foreground = "\${colors.primary}";
        format-full-foreground = "\${colors.primary}";
        full-at = "99";
        low-at = "5";
        battery = "BAT0";
        adapter = "ADP1";
        poll-interval = "5";
        format-charging = "<animation-charging>  <label-charging>";
        format-discharging = "<ramp-capacity>  <label-discharging>";
        format-full = "<ramp-capacity>  <label-full>";
        label-charging = "Charging %percentage%%";
        label-discharging = "Discharging %percentage%%";
        label-low = "BATTERY LOW";

        ramp-capacity-0 = "";
        ramp-capacity-1 = "";
        ramp-capacity-2 = "";
        ramp-capacity-3 = "";
        ramp-capacity-4 = "";

        bar-capacity-width = "10";

        animation-charging-0 = "";
        animation-charging-1 = "";
        animation-charging-2 = "";
        animation-charging-3 = "";
        animation-charging-4 = "";
        animation-charging-framerate = "750";

        animation-discharging-0 = "";
        animation-discharging-1 = "";
        animation-discharging-2 = "";
        animation-discharging-3 = "";
        animation-discharging-4 = "";
        animation-discharging-framerate = "500";

        animation-low-0 = "!";
        #animation-low-1 =
        animation-low-framerate = "200";
      };

      "settings" = {
        screenchange-reload = "true";
        pseudo-transparency = "true";
        compositing-background = "sourc";
        compositing-foreground = "sourc";
        compositing-overline = "sourc";
        compositing-underline = "sourc";
        compositing-border = "sourc";
      };
    };
  };

  home.packages = with pkgs; [
    picom
    nitrogen
    xorg.xrandr
    pavucontrol
    eww
    xorg.xinit
    feh
    killall
    flameshot
    polybar
  ];
}
