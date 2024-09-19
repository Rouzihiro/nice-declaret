{
  pkgs,
  mySettings,
  config,
  ...
}: let
  systemDir = mySettings.systemDir;
in {
  imports = [
    # hardware
    "${systemDir}/hardware/hardware.nix"
    "${systemDir}/hardware/audio.nix"
    "${systemDir}/hardware/bluetooth.nix"
    "${systemDir}/hardware/network.nix"
    "${systemDir}/hardware/opengl.nix"
    "${systemDir}/hardware/timezone.nix"
    "${systemDir}/hardware/zram.nix"

    # security
    "${systemDir}/security/ssh.nix"

    # software
    "${systemDir}/software/all-installing-apps.nix"
    "${systemDir}/software/login-sddm.nix"
    "${systemDir}/software/desktop-i3wm.nix"
    "${systemDir}/software/app-vm.nix"
  ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest; # Kernel

    kernelParams = [
        "systemd.mask=systemd-vconsole-setup.service"
        "systemd.mask=dev-tpmrm0.device" # this is to mask that stupid 1.5 mins systemd bug
        "nowatchdog"
        "modprobe.blacklist=sp5100_tco" # watchdog for AMD
        "modprobe.blacklist=ITCO_wdt" # watchdog for Intel
    ];

    # This is for OBS Virtual Can Support
    kernelModules = [ "v412loopback" ];

    loader.efi.canTouchEfiVariables = true;
    loader.systemd-boot.enable= true;
    
    initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod" ];
    initrd.kernelModules = [ ];
 };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  xdg.portal.config.common.default = "*";

  services.flatpak.enable = true;
  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];
  programs.zsh.enable = true;

  users.users.${mySettings.user.name} = {
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

  # environment.pathsToLink = [ "/share/xdg-desktop-portal" "/share/applications" ];

  system.stateVersion = "24.11";

  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true; # Thumbnail support for images

  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;
}
