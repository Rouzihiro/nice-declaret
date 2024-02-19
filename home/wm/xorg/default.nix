{ config, lib, pkgs, ... }:

{
	imports = [
		./bspwm
	];

	
	services.xserver = {
        	enable = true;
        	displayManager = {
        		lightdm.enable = true;
        		lightdm.greeters.gtk.enable = true;
        		setupCommands = ''
        			${pkgs.xorg.xrandr}/bin/xrandr\
        			--output eDP-1 --brightness .3\
        				--mode 1920x1080 --pos 1600x0\
        					--rotate normal\

        			--output HDMI-1 --brightness 1\
        				--primary --mode 1600x900\
        					--pos 0x0 --rotate normal
        		'';
        	};

        	xkb.options = "grp:rctrl_rshift_toggle, caps:escape";
        };


	environment.systemPackages = with pkgs; [
	];
}
