{
  pkgs,
  mySettings,
  ...
}:
{

  home.file."${mySettings.configDir}/tmux" = {
    source = "${mySettings.userDir}/apps/shell-tmux/src";
  };


}
