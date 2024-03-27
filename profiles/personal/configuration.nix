{
  config,
  lib,
  pkgs,
  systemSettings,
  userSettings,
  ...
}: let
  systemDir = ./../../system;
in {
  imports = [
    (systemDir + /hardware)
    (systemDir + /packages)
    (systemDir + /app/steam.nix)
    (systemDir + /app/vm.nix)

    (systemDir + /hardware-configuration.nix)
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = systemSettings.hostname; # Define your hostname.
  networking.networkmanager.enable = true; # Use networkmanager

  nixpkgs.config.allowUnfree = true;

  nix = {
    package = pkgs.nixFlakes;

    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
    };
  };

  programs.zsh.enable = true;

  users.users.${userSettings.username} = {
    isNormalUser = true;
    description = userSettings.name;
    extraGroups = ["wheel" "networkmanager"];
    initialPassword = "1235";
    shell = pkgs.zsh;
  };

  # Timezone and locale
  time.timeZone = systemSettings.timezone; # time zone
  i18n.defaultLocale = systemSettings.locale;
  i18n.extraLocaleSettings = {
    LC_ADDRESS = systemSettings.locale;
    LC_IDENTIFICATION = systemSettings.locale;
    LC_MEASUREMENT = systemSettings.locale;
    LC_MONETARY = systemSettings.locale;
    LC_NAME = systemSettings.locale;
    LC_NUMERIC = systemSettings.locale;
    LC_PAPER = systemSettings.locale;
    LC_TELEPHONE = systemSettings.locale;
    LC_TIME = systemSettings.locale;
  };

  services.openssh.enable = true;
  hardware.opengl.enable = true;

  # ---------------- Login and Window manager

  # xorg & sddm
  services.xserver = {
    enable = true;
    displayManager = {
      sddm.enable = true;
      setupCommands = ''
        LEFT='HDMI-1'
        RIGHT='eDP-1'
        ${pkgs.xorg.xrandr}/bin/xrandr --output $RIGHT --brightness 0.3 --mode 1920x1080 --pos 1600x0 --rotate normal --output $LEFT --brightness 1 --primary --mode 1600x900 --pos 0x0 --rotate normal
      '';
    };

    xkb.layout = "us, ara";
    xkb.options = "grp:rctrl_rshift_toggle, caps:escape";
  };

  # bspwm & sxhkd
  services.xserver.windowManager.bspwm = {
    enable = true;
    package = pkgs.bspwm;

    sxhkd = {
      package = pkgs.sxhkd;
    };
  };

  services.xserver.windowManager.i3 = {
    enable = true;
    extraPackages = with pkgs; [
      dmenu #application launcher most people use
      i3status # gives you the default i3 status bar
      i3lock #default i3 screen locker
      i3blocks #if you are planning on using i3blocks over i3status
    ];
  };

  # hyprland
  programs.hyprland.enable = true;

  # -----------------------------------------

  environment.variables = {
    SUDO_EDITOR = "nvim";
    SYSTEMD_EDITOR = "nvim";
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  # ZRAM SWAP
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 80;
  };

  system.stateVersion = "24.11";
}
