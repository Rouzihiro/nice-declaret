{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    #=======================
    home-manager

    # browsers
    firefox
    brave

    # myApps
    neovim
    lf
    eza
    wget
    kitty
    alacritty
    git
    mpd
    mpv
    fuzzel
    tofi
    tmux
    btop
    nitrogen
    zip
    unzip
    xfce.thunar
    gnumake
    ripgrep
    colorpicker
    xclip

    #-- C/C++
    gcc

    # --- rust
    rustup
    rust-analyzer-unwrapped
    pkg-config
    glib
    gobject-introspection
    gdk-pixbuf
    pango
    pangolin

    #--- bun
    bun

    #-- nodejs
    nodejs_21
    nodePackages.live-server

    #--- python
    python3
    python311Packages.pip

    #--- dotnet
    dotnet-sdk_8
    vimPlugins.omnisharp-extended-lsp-nvim
    #=======================
  ];
}
