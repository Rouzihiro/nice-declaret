{
  pkgs,
  userSettings,
  ...
}: let
  systemDir = ./../../system;
in {
  imports = [
    # hardware
    (systemDir + /hardware/audio.nix)
    (systemDir + /hardware/bluetooth.nix)
    (systemDir + /hardware/network.nix)
    (systemDir + /hardware/opengl.nix)
    (systemDir + /hardware/timezone.nix)
    (systemDir + /hardware/zram.nix)

    # security
    (systemDir + /security/ssh.nix)

    # desktop
    (systemDir + /desktop/sddm.nix)
    (systemDir + /desktop/hyprland.nix)

    # apps
    (systemDir + /packages)
    (systemDir + /app/steam.nix)
    (systemDir + /app/vm.nix)

    (systemDir + /hardware-configuration.nix)
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

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

  environment.variables = {
    SUDO_EDITOR = userSettings.editor;
    SYSTEMD_EDITOR = userSettings.editor;
    EDITOR = userSettings.editor;
    VISUAL = userSettings.editor;
  };

  system.stateVersion = "24.11";
}
