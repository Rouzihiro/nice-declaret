{pkgs, ...}: {
  home.packages = with pkgs; [
    wireplumber
    eww
    swww
    dunst
    wlr-randr
    wtype
    wl-clipboard
    swayidle
    gtklock
    swaybg
    xwayland
    wlsunset
    pavucontrol
    pamixer
    grim
    slurp
    rofi-wayland
    wofi
    bemenu
    fuzzel
    libnotify
    wpaperd
    mpvpaper
    swappy

    meson
    wayland-protocols
    wayland-utils
    wl-clipboard
    wlroots
  ];
}
