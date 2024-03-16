{ config, pkgs, ... }:

{
    home.file."./.config/nvim/" = {
        source = ./lazy-conf;
        recursive = false;
    };
}
