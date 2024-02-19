{ config, lib, pkgs, ... }:


{

	programs.hyprland.enable = true;
	xdg = {
		portal = {
			enable = true;
		      	extraPortals = with pkgs; [
		       		xdg-desktop-portal-gtk
				xdg-desktop-portal-wlr
				xdg-desktop-portal-hyprland
				xdg-desktop-portal
			];
	    	};
	 };


	environment.systemPackages = with pkgs; [
		waybar
		(waybar.overrideAttrs (oldAttrs: {
				mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
			})
		)
		eww
		swww
		dunst
		wlr-randr
		wtype
		wl-clipboard
		hyprland-protocols
		hyprpicker
		hyprpaper
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
