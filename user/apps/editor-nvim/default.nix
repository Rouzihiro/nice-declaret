{
    mySettings,
    ...
}:
{
    home.file."${mySettings.configDir}/nvim" = {
        source = "${mySettings.userDir}/apps/editor-nvim/src";
    };
}
