{ config, lib, pkgs, ... }:

{
	imports = [
		./hyprland
	];

	environment.sessionVariables = {
		WLR_HARDWARE_CURSORS = "1";
		NIXOS_OZONE_WL = "1";
	};

	hardware.opengl.enable = true;

	environment.systemPackages = with pkgs; [
		wireplumber
	];
}
