{ pkgs, llm-agents-pkgs, ... }:

{
  home.packages = with pkgs; [
    bat                         # cat with syntax highlighting
    llm-agents-pkgs.claude-code # Claude Code CLI
    curl                        # HTTP client
    fzf                         # fuzzy finder
    ripgrep                     # fast grep (rg)
    rsync                       # file sync/transfer
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
}
