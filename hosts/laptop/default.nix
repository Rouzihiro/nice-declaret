{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./../../system/hardware
    ./../../system/vm
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;

  nixpkgs.config.allowUnfree = true;
  # nix.package = pkgs.nix;

  nix = {
    package = pkgs.nixFlakes;
    extraOptions =
      lib.optionalString (config.nix.package == pkgs.nixFlakes)
      "experimental-features = nix-command flakes";

    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
    };
  };

  programs.zsh.enable = true;
  users.users.ravy = {
    shell = pkgs.zsh;
    home = "/home/ravy";
    initialPassword = "1235";
    description = "ravy man";
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager"];
  };

  time.timeZone = "Asia/Riyadh";
  i18n.defaultLocale = "en_US.UTF-8";

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

  environment.systemPackages = with pkgs; [
    home-manager

    # browsers
    firefox
    brave

    # myApps
    neovim
    lf
    eza
    wget
    kitty
    alacritty
    git
    mpd
    mpv
    fuzzel
    tofi
    tmux
    btop
    nitrogen
    zip
    unzip
    vscodium
    xfce.thunar
    gnumake
    ripgrep

    #-- C/C++
    gcc

    # --- rust
    rustup
    rust-analyzer-unwrapped
    pkg-config
    glib
    gobject-introspection
    gdk-pixbuf
    pango
    pangolin

    #--- bun
    bun

    #-- nodejs
    nodejs_21

    #--- python
    python3
    python311Packages.pip

    #--- dotnet
    dotnet-sdk_8
    omnisharp-roslyn
  ];

  # ZRAM SWAP
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 80;
  };

  system.stateVersion = "24.11";
}
