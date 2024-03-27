{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.tmux = {
    enable = true;
    extraConfig = ''
      unbind r
      set -g prefix C-s

      # act like vim
      setw -g mode-keys vi
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
      set -g @plugin 'christoomey/vim-tmux-navigator'
      set -g @plugin 'egel/tmux-gruvbox'
      set -g @tmux-gruvbox 'dark' # or 'light'
      run '~/.config/tmux/plugins/tpm/tpm'

      set-option -g pane-border-lines simple

    '';
  };
}
