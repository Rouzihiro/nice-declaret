{
  pkgs,
  mySettings,
  ...
}: {
  # xorg & login
  services.xserver.enable = true;
  services.xserver.xkb.layout = mySettings.user.keyboard.layout;
  services.xserver.xkb.options = mySettings.user.keyboard.options;

  services.displayManager.lightdm.enable = true; 
  # setupCommands = ''
  #   LEFT='HDMI-1'
  #   RIGHT='eDP-1'
  #   ${pkgs.xorg.xrandr}/bin/xrandr --output $RIGHT --brightness 0.3 --mode 1920x1080 --pos 1600x0 --rotate normal --output $LEFT --brightness 1 --primary --mode 1600x900 --pos 0x0 --rotate normal
  # '';


}
