{ config, pkgs, ... }:

{
    home.file.".config/nvim".source = "/home/ravy/.dotnix/user/editors/neovim/src";
}
