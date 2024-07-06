{
  config,
    pkgs,
    mySettings,
    ...
}: let 

codeBgColor = "#" + config.lib.stylix.colors.base00;
termBgColor = "#" + config.lib.stylix.colors.base00;

# codeBgColor = "#1d2021";
# termBgColor = "#1c1c1c";

in {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      jdinhlife.gruvbox
        pkief.material-icon-theme
        vscodevim.vim
        esbenp.prettier-vscode
        usernamehw.errorlens
        alefragnani.project-manager
        svelte.svelte-vscode
        ritwickdey.liveserver
        bbenoist.nix
    ];
  };

  home.file.".config/Code/User/settings.json".source = config.lib.file.mkOutOfStoreSymlink "${mySettings.user.dotfilesDir}/user/editors/vscode/sets.json";
  home.file.".config/Code/User/keybindings.json".source = config.lib.file.mkOutOfStoreSymlink "${mySettings.user.dotfilesDir}/user/editors/vscode/keys.json";
}
