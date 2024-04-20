{
  config,
  pkgs,
  mySettings,
  ...
}: {
  programs.firefox = {
    enable = true;
    profiles.${mySettings.user.username} = {
      id = 0;
      isDefault = true;
      name = mySettings.user.username;

      # Add userChrome and userContent based on user preferences
      # userChrome =
      #   pkgs.lib.optional mySettings.user.firefox.userChrome
      #   "${config.home.homeDirectory}/${mySettings.user.firefox.userChrome}";
      # userContent =
      #   pkgs.lib.optional mySettings.user.firefox.userContent
      #   "${config.home.homeDirectory}/${mySettings.user.firefox.userContent}";
    };
  };

  # Optional: Copy userChrome and userContent directories (consider user input)
  home.file."${config.home.homeDirectory}/.dotnix/user/browser/firefox/ShyFox/chrome" = {
    source = "${config.home.homeDirectory}/.mozilla/firefox/${mySettings.user.username}";
    recursive = true;
  };

  home.file."${config.home.homeDirectory}/.dotnix/user/browser/firefox/ShyFox/content" = {
    source = "${config.home.homeDirectory}/.mozilla/firefox/${mySettings.user.username}";
    recursive = true;
  };
}
