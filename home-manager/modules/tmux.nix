{ pkgs, ... }:

let
  tmux-monokai-pro = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "monokai-pro";
    version = "69e378e";
    rtpFilePath = "monokai.tmux";
    src = pkgs.fetchFromGitHub {
      owner = "maxpetretta";
      repo = "tmux-monokai-pro";
      rev = "69e378e955ccd9afcb8ad1aa4011f71c80b892d9";
      sha256 = "1qw6gb0qgah0sy50205q2wvl16fvsfirwynvy5m32f5npcp02l1f";
    };
  };
in

{
  programs.tmux = {
    enable = true;
    terminal = "tmux-256color";
    historyLimit = 100000;
    keyMode = "vi";
    mouse = true;
    prefix = "C-b";
    escapeTime = 0;
    baseIndex = 1;
    plugins = with pkgs.tmuxPlugins; [
      resurrect
      tmux-monokai-pro
    ];
    extraConfig = ''
      # Explicitly set prefix (C-b is default but must be set to override any previous config)
      set -g prefix C-b
      unbind C-a

      # True color support
      set -ag terminal-overrides ",xterm-256color:RGB"

      # Reduce key repeat delay
      set -sg repeat-time 300

      # Split panes with | and - (preserving current path)
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"

      # Reload config
      bind r source-file ~/.config/tmux/tmux.conf \; display "Reloaded!"

      # Copy to OS clipboard (macOS)
      bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "pbcopy"

      # Show current directory as tab name instead of process name
      set -g automatic-rename on
      set -g automatic-rename-format '#{b:pane_current_path}'
    '';
  };
}
