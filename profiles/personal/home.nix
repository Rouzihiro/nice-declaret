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
    (userDir + /editors/neovim)
    (userDir + /terminals/alacritty)
    (userDir + /terminals/kitty)

    (userDir + /shells/zsh.nix)
    (userDir + /shells/tmux.nix)

    (userDir + /themes)
    (userDir + /fonts)
    (userDir + /style/stylix.nix)


    ../hack/tools.nix
    # ../work/home.nix
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
    obs-studio
    obsidian
    gromit-mpx
    qutebrowser
    telegram-desktop
    whatsapp-for-linux
    emacs
    libreoffice
    vlc
    looking-glass-client
    android-studio
    fzf
    weylus

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

  xdg = {
    enable = true;
    userDirs = {
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
  };

  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      "text/html" = "org.${mySettings.user.browser}.${mySettings.user.browser}.desktop";
      "x-scheme-handler/http" = "org.${mySettings.user.browser}.${mySettings.user.browser}.desktop";
      "x-scheme-handler/https" = "org.${mySettings.user.browser}.${mySettings.user.browser}.desktop";
      "x-scheme-handler/about" = "org.${mySettings.user.browser}.${mySettings.user.browser}.desktop";
      "x-scheme-handler/unknown" = "org.${mySettings.user.browser}.${mySettings.user.browser}.desktop";
    };
  };

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
