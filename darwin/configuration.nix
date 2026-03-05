{ pkgs, ... }:

{
  imports = [
    ./apps.nix
    ./fonts.nix
  ];

  # Touch ID for sudo via sudo_local (persists across macOS updates)
  security.pam.services.sudo_local.touchIdAuth = true;

  # Required: declare the user that home-manager will manage
  users.users.jgagnon = {
    name = "jgagnon";
    home = "/Users/jgagnon";
    shell = pkgs.fish;
  };

  # Enable fish at the system level so nix-darwin adds it to /etc/shells
  programs.fish.enable = true;
  environment.shells = [ pkgs.fish ];

  # Determinate Nix manages its own daemon — disable nix-darwin's management
  nix.enable = false;

  # Required for options that apply to a specific user (e.g. homebrew)
  system.primaryUser = "jgagnon";

  # Required nix-darwin state version — do not change after initial setup
  system.stateVersion = 5;
}
