{ config, lib, pkgs, ... }:

{
	imports = [
		./hyprland
	];

	home.packages = with pkgs; [
		waybar
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
	];
}
