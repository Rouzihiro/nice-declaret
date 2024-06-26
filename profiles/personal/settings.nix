{pkgs, ...}: let
  # ---- SYSTEM SETTINGS ---- #
  system = {
    system = "x86_64-linux"; # system arch
    hostname = "nixos"; # hostname
    profile = "personal"; # select a profile defined from my profiles directory
    timezone = "Asia/Riyadh"; # select timezone
    locale = "en_US.UTF-8"; # select locale
    bootMode = "uefi"; # uefi or bios
    bootMountPath = "/boot"; # mount path for efi boot partition; only used for uefi boot mode
    grubDevice = ""; # device identifier for grub; only used for legacy (bios) boot mode
  };

  # ----- USER SETTINGS ----- #
  user = rec {
    username = "ravy"; # username
    name = "Ravy";
    github = {
      name = "0xravy";
      email = "0xravy@gmail.com"; # email (used for certain configurations)
    };
    keyboard = {
      layout = "us, ara";
      options = "grp:rctrl_rshift_toggle, caps:escape";
    };
    dotfilesDir = "~/.dotnix"; # absolute path of the local repo
    theme = "hack-the-box"; # selcted theme from my themes directory (./themes/)
    wm = "hyprland"; # Selected window manager or desktop environment; must select one in both ./user/wm/ and ./system/wm/
    # window manager type (hyprland or x11) translator
    wmType =
      if (wm == "hyprland")
      then "wayland"
      else "x11";
    browser = "brave"; # Default browser; must select one from ./user/app/browser/
    defaultRoamDir = "personal"; # Default org roam directory relative to ~/Org
    term = "kitty"; # Default terminal command;
    # font = "Monaspace Krypton, Fira Code, Monaco, monospace"; # Selected font
    # fontPkg = pkgs.monaspace; # Font package
    font = "JetBrains Mono, Consolas, 'Courier New', monospace"; # Selected font
    fontPkg = pkgs.nerdfonts; # Font package
    editor = "nvim"; # Default editor;
    spawnEditor = "nvim";
  };

  scriptsDir = "${user.dotfilesDir}/scripts";
in {
    inherit system user scriptsDir;
}
