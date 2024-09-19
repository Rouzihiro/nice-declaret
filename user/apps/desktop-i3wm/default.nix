{
    mySettings,
    pkgs,
    ...
}:
{
    home.file."${mySettings.configDir}/i3" = {
        source = "${mySettings.userDir}/apps/desktop-i3wm/src";
        recursive = true;
    };
}
