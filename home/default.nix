{ config, pkgs, ... }:

{
  home.username = "ravy";
  home.homeDirectory = "/home/ravy";

  imports = [
	#./wm/wayland
  	./shells
  	./editors
	./themes
	./terminals
  ];


  # Packages that should be installed to the user profile.
 home.packages = with pkgs; [
   neofetch
   vesktop
   lazygit
   bat
   themechanger
   pistol
   ctpv
   godot_4
 ];


  programs.git = {
    enable = true;
    userName  = "0xravy";
    userEmail = "0xravy@gamil.com";
  };

  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
