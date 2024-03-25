{pkgs, ...}: {
  fonts.fontconfig.enable = true;
  home.packages = [
    (pkgs.nerdfonts.override {
      fonts = [
        "FiraCode"
        "DroidSansMono"
      ];
    })

    pkgs.monaspace
    pkgs.udev-gothic-nf

    pkgs.nerdfonts
  ];
}
