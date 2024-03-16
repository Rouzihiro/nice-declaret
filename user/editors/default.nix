{
  config,
  pkgs,
  ...
}: {
  imports = [
    # ./nixvim
    # ./neovim
    ./vscode
  ];
}
