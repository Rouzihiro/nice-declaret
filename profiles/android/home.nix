{
  config,
  pkgs,
  ...
}: {
  # Use the same overlays as the system packages
  nixpkgs = {inherit (config.nixpkgs) overlays;};

  home.stateVersion = "22.05";
}
