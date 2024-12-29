{
  pkgs,
  pkgs-stable,
  ...
}: {
  environment.systemPackages = [
    pkgs.home-manager

    # => BROWSERS
    pkgs.firefox

    # => APPS
    pkgs.util-linux
    pkgs.neovim
    pkgs.lf
    pkgs.eza
    pkgs.wget
    pkgs.kitty
    pkgs.alacritty
    pkgs.git
    pkgs.mpd
    pkgs.mpv
    pkgs.xwinwrap
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
    pkgs.xcolor
    pkgs.xclip
    pkgs.light
    pkgs.gns3-server
    pkgs.postman

    # NOTE: PROGRAMMING LNAGUAGES

    # {?} => NIX

    pkgs.nixd # NIX lsp
    pkgs.alejandra # NIX formatter

    # {?} => C/C++

    pkgs.gcc # C compiler
    pkgs.clang # C++ compiler

    # {?} => deno

    pkgs.deno # JS compiler

    # {?} => bun

    pkgs.bun # JS compiler

    # {?} => nodejs

    pkgs.nodejs_22 # NodeJS compiler
    pkgs.nodePackages.live-server # liveserver package

    pkgs.svelte-language-server

    # {?} => python

    pkgs.python3 # PY compiler
    pkgs.python311Packages.pip # PY package manager

    # {?} => rust

    pkgs.rustup # RUST tolls
    pkgs.rust-analyzer # RUST LSP

    # {?} => java

    # pkgs.openjdk22
    # jdk8_headless
    # jre8
    # pkgs.javaPackages.openjfx22
    # pkgs.jdt-language-server

    # {?} => go

    pkgs.libcap
    pkgs.go # GO compiler
    pkgs.gofumpt # GO formatter
    pkgs.goimports-reviser # GO formatter
    pkgs.golines # GO formatter

    # {?} => lua

    pkgs.lua # LUA compiler
    pkgs.lua-language-server # LUA lsp
    pkgs.luajitPackages.luarocks # LUA package manager
  ];
}
