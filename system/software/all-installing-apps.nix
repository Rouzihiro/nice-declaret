{
  pkgs,
  pkgs-stable,
  ...
}: {
  environment.systemPackages = [
    pkgs.home-manager

    # NOTE: FONTS
    pkgs.nerdfonts

    # NOTE: BROWSERS
    pkgs.firefox

    # NOTE: APPS
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
    pkgs.nvtopPackages.full
    pkgs.zip
    pkgs.unzip
    pkgs.xfce.thunar
    pkgs.gnumake
    pkgs.ripgrep
    pkgs.colorpicker
    pkgs.xclip
    pkgs.light

    # NOTE: PROGRAMMING LNAGUAGES

    # {?} =====> NIX

    pkgs.nixd # NIX lsp
    pkgs.alejandra # NIX formatter

    # {?} =====> C/C++

    pkgs.gcc # C compiler
    pkgs.clang # C++ compiler

    # {?} =====> bun

    pkgs.bun # JS compiler

    # {?} =====> nodejs

    pkgs.nodejs_22 # NodeJS compiler
    pkgs.nodePackages.live-server # liveserver package

    # {?} =====> python

    pkgs.python3 # PY compiler
    pkgs.python311Packages.pip # PY package manager

    # {?} =====> rust

    pkgs.rustup # RUST tolls
    pkgs.rust-analyzer # RUST LSP

    # {?} =====> java

    pkgs.openjdk8-bootstrap
    # jdk8_headless
    # jre8
    pkgs.javaPackages.openjfx11
    pkgs.jdt-language-server

    # {?} =====> go

    pkgs.libcap
    pkgs.go # GO compiler
    pkgs.gofumpt # GO formatter
    pkgs.goimports-reviser # GO formatter
    pkgs.golines # GO formatter

    # {?} =====> lua

    pkgs.lua # LUA compiler
    pkgs.lua-language-server # LUA lsp
    pkgs.luajitPackages.luarocks # LUA package manager
  ];
}
