{
    lib,
    mySettings,
    ...
}:
{

    home.file."${mySettings.configDir}/kitty" = {
        source = "${mySettings.userDir}/apps/term-kitty/src";
        recursive = true;
    };
}
