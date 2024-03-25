{pkgs, ...}: {
  # Simply install just the packages
  environment.packages = with pkgs; [
    neofetch
    neovim
    diffutils
    findutils
    utillinux
    tzdata
    hostname
    man
    gnugrep
    gnupg
    gnused
    gnutar
    bzip2
    gzip
    xz
    zip
    zsh
    unzip
    btop
    git
    wget
  ];

  system.stateVersion = "22.05";

  # Backup etc files instead of failing to activate generation if a file already exists in /etc
  home-manager.config = ./home.nix;
  home-manager.useGlobalPkgs = true;

  environment.etcBackupExtension = ".bak";
}
