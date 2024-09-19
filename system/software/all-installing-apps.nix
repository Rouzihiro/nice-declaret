{
  pkgs,
  pkgs-stable,
  ...
}: {
  environment.systemPackages = [
    #=======================
    pkgs.home-manager

    # fonts
    pkgs.nerdfonts

    # browsers
    pkgs.firefox

    # myApps
    pkgs.neovim
    pkgs.lf
    pkgs.eza
    pkgs.wget
    pkgs.kitty
    pkgs.alacritty
    pkgs.git
    pkgs.mpd
    pkgs.mpv
    pkgs.fuzzel
    pkgs.tofi
    pkgs.tmux
    pkgs.btop
    pkgs.nvtop
    pkgs.nitrogen
    pkgs.zip
    pkgs.unzip
    pkgs.xfce.thunar
    pkgs.gnumake
    pkgs.ripgrep
    pkgs.colorpicker
    pkgs.xclip
    pkgs.light

    #-- C/C++
    pkgs.gcc

    #--- bun
    pkgs.bun

    #-- nodejs
    pkgs.nodejs_22
    pkgs.nodePackages.live-server

    #--- python
    pkgs.python3
    pkgs.python311Packages.pip

    #=======================
  ];
}
