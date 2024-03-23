{
  config,
  pkgs,
  ...
}: {
  xsession.windowManager.i3 = {
    enable = true;
  };

  xdg.configFile."i3blocks/config".source = ./i3-conf/config;
  home.file.".gdbinit".text = ''
    set auto-load safe-path /nix/store
  '';
}
