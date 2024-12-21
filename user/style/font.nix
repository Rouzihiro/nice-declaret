{pkgs, ...}: {
  fonts.fontconfig.enable = true;

  xdg.configFile."fontconfig/fonts.conf".text = ''
    <fontconfig>
      <dir>~/.local/share/fonts</dir>
    </fontconfig>
  '';

  home.packages = [
    pkgs.udev-gothic-nf
    pkgs.swaycons

    pkgs.pixel-code

    pkgs.monaspace

    pkgs.monocraft
    pkgs.miracode

    pkgs.nerd-fonts.hack
    pkgs.nerd-fonts.fira-code
    pkgs.nerd-fonts.droid-sans-mono
    pkgs.nerd-fonts.symbols-only
  ];
}
