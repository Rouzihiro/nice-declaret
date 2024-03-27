{
  config,
  pkgs,
  ...
}: let
  myAliases = {
    t = "tmux";
    ls = "exa --icons";
    lt = "exa --icons --tree";
    la = "exa -a -l --icons";
    lg = "exa -a -l --icons --git";
    v = "nvim";
    sv = "sudo nvim";
    cat = "bat -p";
    nixreb = "sudo nixos-rebuild switch --flake ~/.dotnix";
    nixgar = "sudo nix-collect-garbage -d; sudo rm -rf /etc/nixos; sudo cp -r ~/.dotnix /etc/nixos; sudo nixos-rebuild boot";
  };
in {
  programs.zsh = {
    enable = true;
    initExtra = ''
      PROMPT=" ◉ %U%F{magenta}%n%f%u@%U%F{blue}%m%f%u:%F{yellow}%~%f
       %F{green}→%f "
      [ $TERM = "dumb" ] && unsetopt zle && PS1='$ '

        tmux
        clear
    '';
    shellAliases = myAliases;
    dotDir = ".config/zsh";
    enableCompletion = true;
    history = {
      expireDuplicatesFirst = true;
      extended = true;
      ignoreDups = true;
      path = "${config.home.homeDirectory}/.config/zsh/.zsh_history";
      save = 10000;
      share = true;
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "sudo"
        "terraform"
        "systemadmin"
        "vi-mode"
      ];
      theme = "miloshadzic";
    };

    zplug = {
      enable = true;
      plugins = [
        {name = "zsh-users/zsh-autosuggestions";}
      ];
    };
  };
}
