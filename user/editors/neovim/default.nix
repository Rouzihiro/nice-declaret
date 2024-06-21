{ config, pkgs, ... }:

{
    xdg.enable = true;

    xdg.configFile."src".source = /home/ravy/.dotnix/user/editors/neovim/src;

}
