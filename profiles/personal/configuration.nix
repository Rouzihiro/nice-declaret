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

  boot = {
    kernelParams = ["amd_iommu=on" "immou=pt"];
    kernelModules = ["vfio-pci.ids=10de:25ac,10de:2291"];
    blacklistedKernelModules = ["nouveau"];

    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi"; # ← use the same mount point here.
      };
      grub = {
        efiSupport = true;
        device = "nodev";
      };
    };
  };

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
