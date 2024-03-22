{
  config,
  lib,
  pkgs,
}: {
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

  programs.java.enable = true;

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "steam"
      "steam-original"
      "steam-run"
    ];

  programs.steam.package = pkgs.steam.override {
    withJava = true;
    withPrimus = true;
    # extraPkgs = pkgs: [bumblebee glxinfo];
  };
}
