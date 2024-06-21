{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  buildInputs = [
    pkgs.libsoup3
    pkgs.javascriptcoregtk
    pkgs.pkg-config
    pkgs.gobject-introspection
    pkgs.glib
    pkgs.cairo
    pkgs.gtk3
  ];
}

