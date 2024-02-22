{ config, pkgs, lib, ... }:

{
    home.username = "ravy";
    home.homeDirectory = "/home/ravy";

    imports = [
        ./wm
        ./shells
        ./editors
        ./themes
        ./terminals
        ./fonts
    ];


    home.packages = with pkgs; [
        neofetch
        vesktop
        lazygit
        bat
        themechanger
        pistol
        ctpv
        godot_4
        cava
    ];

    programs.git = {
        enable = true;
        userName  = "0xravy";
        userEmail = "0xravy@gamil.com";
    };

    home.stateVersion = "23.11";

    programs.home-manager.enable = true;
}
