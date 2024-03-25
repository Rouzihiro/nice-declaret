{
  config,
  pkgs,
  lib,
  inputs,
  userSettings,
  ...
}: let
  userDir = ./../../user;
in {
  home.username = userSettings.username;
  home.homeDirectory = "/home/${userSettings.username}";

  imports = [
    (userDir + /wm/xorg/bspwm)

    (userDir + /wm/wayland)
    (userDir + /wm/wayland/hyprland)

    # (userDir + /browsers/firefox)
    (userDir + /editors/vscode)
    (userDir + /terminals/alacritty)

    (userDir + /shells/zsh.nix)

    (userDir + /themes)
    (userDir + /fonts)

    ../hack/tools.nix
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
    whatsapp-for-linux
  ];

  services.syncthing.enable = true;

  xdg.enable = true;
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    music = "${config.home.homeDirectory}/Media/Music";
    videos = "${config.home.homeDirectory}/Media/Videos";
    pictures = "${config.home.homeDirectory}/Media/Pictures";
    templates = "${config.home.homeDirectory}/Templates";
    download = "${config.home.homeDirectory}/Downloads";
    documents = "${config.home.homeDirectory}/Documents";
    desktop = null;
    publicShare = null;
    extraConfig = {
      XDG_DOTFILES_DIR = "${config.home.homeDirectory}/.dotnix";
      XDG_ARCHIVE_DIR = "${config.home.homeDirectory}/Archive";
      XDG_VM_DIR = "${config.home.homeDirectory}/Machines";
      XDG_ORG_DIR = "${config.home.homeDirectory}/Org";
      XDG_PODCAST_DIR = "${config.home.homeDirectory}/Media/Podcasts";
      XDG_BOOK_DIR = "${config.home.homeDirectory}/Media/Books";
    };
  };

  xdg.mime.enable = true;
  xdg.mimeApps.enable = true;

  programs.git = {
    enable = true;
    userName = userSettings.github.name;
    userEmail = userSettings.github.email;
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
