{ config, lib, pkgs, ... }:

{

        services.xserver.windowManager.bspwm = {
        	enable = true;
        	package = pkgs.bspwm;

        	sxhkd = {
        		package = pkgs.sxhkd;
        	};

        };
		

	environment.systemPackages = with pkgs; [
		sxhkd
		polybar
		picom
		nitrogen
		xorg.xrandr
		rofi
		pavucontrol
		eww
		xorg.xinit
		feh
		killall
	];
}
