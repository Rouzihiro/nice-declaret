{
    mySettings,
    pkgs,
    ...
}:
{
    home.file."${mySettings.configDir}/picom" = {
        source = "${mySettings.userDir}/apps/app-picom/src";
        recursive = true;
    };
}
