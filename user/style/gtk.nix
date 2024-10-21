{ pkgs
, ...
}:
{
  gtk = {
    enable = true;
    iconTheme = {
      name = "Gruvbox Plus Dark";
      package = pkgs.gruvbox-plus-icons;
    };
    cursorTheme = {
      name = "Banana";
      package = pkgs.banana-cursor;
    };
    theme = {
      package = pkgs.gruvbox-gtk-theme;
      name = "Gruvbox Dark";
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };
}
