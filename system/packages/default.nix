{
  pkgs,
  pkgs-stable,
  ...
}: {



  environment.systemPackages = [
    #=======================
    pkgs.home-manager

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

    # --- rust
    # pkgs.rustup
    # pkgs.rust-analyzer-unwrapped
    # pkgs.pkg-config
    # pkgs.glib
    # pkgs.gobject-introspection
    # pkgs.gdk-pixbuf
    # pkgs.pango
    # pkgs.pangolin
    # pkgs.lispPackages.cl-webkit2
    # pkgs.cairo
    # pkgs.gdk-pixbuf
    # pkgs.curl
    # pkgs.wget
    # pkgs.dbus
    # pkgs.openssl_3
    # pkgs.gtk3
    # pkgs.libsoup
    # pkgs.webkitgtk
    # pkgs.librsvg

    #--- bun
    pkgs.bun

    #-- nodejs
    pkgs.nodejs_22
    pkgs.nodePackages.live-server

    #--- python
    pkgs.python3
    pkgs.python311Packages.pip

    #--- dotnet
    pkgs.dotnet-sdk_8
    pkgs.vimPlugins.omnisharp-extended-lsp-nvim
    #=======================
  ];
}
