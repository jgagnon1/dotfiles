{ ... }:

{
  imports = [
    ./modules/base.nix
    ./modules/claude.nix
    ./modules/fish.nix
    ./modules/git.nix
    ./modules/ghostty.nix
    ./modules/jujutsu.nix
    ./modules/tmux.nix
  ];

  home.username = "jgagnon";
  home.homeDirectory = "/Users/jgagnon";

  # Required — do not change unless you know what you're doing
  home.stateVersion = "24.11";

  # Let home-manager manage itself
  programs.home-manager.enable = true;
}
