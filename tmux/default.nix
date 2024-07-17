{pkgs, ...}: {
  imports = [
    ./tmux-sessionizer.nix
  ];

  programs.tmux = {
    enable = true;

    shortcut = "A";
    # Stop tmux+escape craziness.
    escapeTime = 0;
    # Force tmux to use /tmp for sockets (WSL2 compat)
    secureSocket = false;
    keyMode = "vi";

    plugins = with pkgs; [
      tmuxPlugins.nord
      tmuxPlugins.sensible
      tmuxPlugins.prefix-highlight
    ];

    extraConfig = ''
        set -sa terminal-overrides "*:Tc"
        set -g default-terminal "screen-256color"
        set-window-option -g mode-keys vi
        set-option -g default-shell /run/current-system/sw/bin/fish

        bind -n M-h select-pane -L
        bind -n M-j select-pane -D
        bind -n M-k select-pane -U
        bind -n M-l select-pane -R
        set -sg escape-time 0

        set-option -g pane-active-border-style fg=green
        setw -g window-status-format "#[underscore]#{?#{==:#{window_panes},1},,+}#[bold]#W#[nobold]:#{=|-24|…;s|$HOME|~|:pane_current_path}"
        set-option -g history-limit 5000

        # set active-inactive window styles
        set -g window-style 'fg=colour247,bg=colour236'
        set -g window-active-style 'fg=default,bg=colour234'

        # # split panes using | and -
        bind | split-window -h
        bind - split-window -v
        unbind '"'
        unbind %

        # To use mouse to scroll
        set -g mouse on
        bind -T copy-mode-vi y send-keys -X copy-pipe 'xclip -in -selection clipboard'
        bind-key -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe "xclip -in -selection clipboard"

        # When a file has been detected to have been changed outside of Vim and it has
        # not been changed inside of Vim, automatically read it again.
        set-option -g focus-events on
    '';
  };
}
