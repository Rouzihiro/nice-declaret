{
  pkgs,
  mySettings,
  ...
}: let
  systemDir = ./../../system;
in {
  imports = [
    # hardware
    (systemDir + /hardware/audio.nix)
    (systemDir + /hardware/bluetooth.nix)
    (systemDir + /hardware/network.nix)
    # (systemDir + /hardware/nvidia.nix)
    (systemDir + /hardware/opengl.nix)
    (systemDir + /hardware/timezone.nix)
    (systemDir + /hardware/zram.nix)

    # security
    (systemDir + /security/ssh.nix)

    # desktop
    (systemDir + /desktop/login.nix)
    (systemDir + /desktop/hyprland.nix)
    (systemDir + /desktop/bspwm.nix)

    # apps
    (systemDir + /packages)
    (systemDir + /app/steam.nix)
    (systemDir + /app/vm.nix)

    (systemDir + /hardware-configuration.nix)
  ];

  # boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;

  programs.zsh.enable = true;

  users.users.${mySettings.user.username} = {
    isNormalUser = true;
    description = mySettings.user.name;
    extraGroups = ["wheel" "networkmanager"];
    initialPassword = "1235";
    shell = pkgs.zsh;
  };

  environment.variables = {
    SUDO_EDITOR = mySettings.user.editor;
    SYSTEMD_EDITOR = mySettings.user.editor;
    EDITOR = mySettings.user.editor;
    VISUAL = mySettings.user.editor;
  };

  system.stateVersion = "24.11";

  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;
}
