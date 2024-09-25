{
    pkgs,
    lib,
    mySettings,
    ...
}:
{
    gtk.cursorTheme.package = pkgs.apple-cursor;
    gtk.cursorTheme.name = "macOS-BigSUr-White";
    #gtk.cursorTheme.size = 16;

    gtk.theme.package = lib.mkDefault pkgs.gruvbox-dark-gtk;
    gtk.theme.name = lib.mkDefault "gruvbox-dark";

    gtk.iconTheme.package = pkgs.gruvbox-dark-icons-gtk;
    gtk.iconTheme.name = "oomox-gruvbox-dark";
}
