{
  config,
  pkgs,
  lib,
  inputs,
  userSettings,
  ...
}: {
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
    blender
    cava
    inputs.Neve.packages.${system}.default
    obs-studio
    obsidian
    gromit-mpx
    qutebrowser
    telegram-desktop
  ];

  programs.git = {
    enable = true;
    userName = "0x${userSettings.username}";
    userEmail = userSettings.email;
  };

  home.sessionVariables = {
    EDITOR = userSettings.editor;
    SPAWNEDITOR = userSettings.spawnEditor;
    TERM = userSettings.term;
    BROWSER = userSettings.browser;
  };

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
