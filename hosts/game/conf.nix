{
  pkgs,
  # pkgs-stable,
  ...
}: {
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;

  environment.systemPackages = [
    pkgs.mangohud # show hardware using
    pkgs.protonup # proton game runner
    pkgs.lutris # game luncher
    pkgs.heroic # game lucher
    pkgs.bottles # exe runner
  ];

  programs.gamemode.enable = true;

  environment.sessionVariables = {
    # this for protonup
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };
}
