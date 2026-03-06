{ pkgs, ... }:

{
  home.packages = with pkgs; [
    mise      # dev tool version manager
    starship  # cross-shell prompt
  ];

  programs.fish = {
    enable = true;
    shellInit = ''
      fish_add_path /opt/homebrew/bin /opt/homebrew/sbin
      mise activate fish | source
      set -gx DOCKER_HOST "unix://$HOME/.colima/default/docker.sock"
    '';
    shellAliases = {
      drs = "sudo darwin-rebuild switch --flake \"$HOME/.dotfiles/nix#\"(hostname -s)";
      drup = "cd $HOME/.dotfiles/nix && nix flake update && drs";
    };
    shellAbbrs = {
      g = "git";
      vim = "nvim";
      cat = "bat";
      grep = "rg";
    };
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };
}
