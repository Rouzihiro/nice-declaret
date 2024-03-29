{pkgs, ...}: {
  # bspwm & sxhkd
  services.xserver.windowManager.bspwm = {
    enable = true;
    package = pkgs.bspwm;

    sxhkd = {
      package = pkgs.sxhkd;
    };
  };
}
