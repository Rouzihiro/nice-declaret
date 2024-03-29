{
  config,
  pkgs,
  userSettings,
  ...
}: {
  programs.firefox = {
    enable = true;
    profiles.${userSettings.username} = {
      id = 0;
      isDefault = true;
      name = userSettings.username;

      # Add userChrome and userContent based on user preferences
      # userChrome =
      #   pkgs.lib.optional userSettings.firefox.userChrome
      #   "${config.home.homeDirectory}/${userSettings.firefox.userChrome}";
      # userContent =
      #   pkgs.lib.optional userSettings.firefox.userContent
      #   "${config.home.homeDirectory}/${userSettings.firefox.userContent}";
    };
  };

  # Optional: Copy userChrome and userContent directories (consider user input)
  home.file."${config.home.homeDirectory}/.dotnix/user/browser/firefox/ShyFox/chrome" = {
    source = "${config.home.homeDirectory}/.mozilla/firefox/${userSettings.username}";
    recursive = true;
  };

  home.file."${config.home.homeDirectory}/.dotnix/user/browser/firefox/ShyFox/content" = {
    source = "${config.home.homeDirectory}/.mozilla/firefox/${userSettings.username}";
    recursive = true;
  };
}
