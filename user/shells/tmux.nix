{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    shortcut = "s";
    prefix = "C-s";

    plugins = [
      pkgs.tmuxPlugins.cpu
      {
        plugin = pkgs.tmuxPlugins.resurrect;
        extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      }
      {
        plugin = pkgs.tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '60' # minutes
        '';
      }
      {
        plugin = pkgs.tmuxPlugins.gruvbox;
        extraConfig = ''
          set -g @plugin 'egel/tmux-gruvbox'
          set -g @tmux-gruvbox 'dark' # or 'light'
        '';
      }

      {
        plugin = pkgs.tmuxPlugins.vim-tmux-navigator;
        extraConfig = ''
          set -g @plugin 'christoomey/vim-tmux-navigator'
        '';
      }
    ];

    extraConfig = ''
      unbind r

      # act like vim
      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R

      # resize
      bind-key -r H resize-pane -L 10
      bind-key -r L resize-pane -R 10
      bind-key -r K resize-pane -U 10
      bind-key -r J resize-pane -D 10

      # plugins
      set -g @plugin 'tmux-plugins/tpm'
      run '~/.config/tmux/plugins/tpm/tpm'

      set-option -g status-position top
      set-option -g pane-border-lines simple
    '';
  };
}
