{
  config,
  pkgs,
  inputs,
  mySettings,
  stylix,
  ...
}: let
  userDir = ./../../user;
in {
  home.username = mySettings.user.username;
  home.homeDirectory = "/home/${mySettings.user.username}";

  imports = [
    stylix.homeManagerModules.stylix

    # xorg
    (userDir + /desktop/xorg/bspwm)
    # (userDir + /wm/xorg/i3wm)

    # wayland
    (userDir + /desktop/wayland)
    (userDir + /desktop/wayland/hyprland.nix)
    (userDir + /desktop/wayland/waybar.nix)

    # (userDir + /browsers/firefox)
    (userDir + /editors/vscode)
    (userDir + /terminals/alacritty)

    (userDir + /shells/zsh.nix)
    (userDir + /shells/tmux.nix)

    (userDir + /themes)
    (userDir + /fonts)
    (userDir + /style/stylix.nix)

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
    emacs
    libreoffice
    davinci-resolve
    vlc

    # wine
    wineWowPackages.stable

    # games
    lutris
    heroic
    grapejuice

    # browsers
    brave
    floorp

    # networking
    networkmanagerapplet
  ];

  services.syncthing.enable = true;

  xdg.enable = true;
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    music = "${config.home.homeDirectory}/Music";
    videos = "${config.home.homeDirectory}/Videos";
    pictures = "${config.home.homeDirectory}/Pictures";
    templates = "${config.home.homeDirectory}/Templates";
    download = "${config.home.homeDirectory}/Downloads";
    documents = "${config.home.homeDirectory}/Documents";
    desktop = "${config.home.homeDirectory}/Desktop";
    publicShare = null;
    extraConfig = {
      XDG_DOTFILES_DIR = "${config.home.homeDirectory}/.dotnix";
      XDG_ARCHIVE_DIR = "${config.home.homeDirectory}/Archive";
      XDG_VM_DIR = "${config.home.homeDirectory}/Machines";
      XDG_BOOK_DIR = "${config.home.homeDirectory}/Books";
      XDG_WALLPAPER_DIR = "${config.home.homeDirectory}/Wallpaper";
    };
  };

  # xdg.mime.enable = true;
  # xdg.mimeApps.enable = true;

  programs.git = {
    enable = true;
    userName = mySettings.user.github.name;
    userEmail = mySettings.user.github.email;
  };

  home.sessionVariables = {
    EDITOR = mySettings.user.editor;
    SPAWNEDITOR = mySettings.user.spawnEditor;
    TERM = mySettings.user.term;
    BROWSER = mySettings.user.browser;
  };

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
