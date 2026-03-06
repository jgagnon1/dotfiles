{ pkgs, ... }:

{
  imports = [ ../configuration.nix ];

  networking.hostName = "jgagnon-wsmb";

  # Leave /etc/zshrc, /etc/zshenv, /etc/zprofile to the company MDM tool
  programs.zsh.enable = false;

  # Work-specific Homebrew packages
  homebrew = {
    taps = [ "wealthsimple/tap" ];
    brews = [
      "gh"
      "gitleaks"
      "jq"
      "lefthook"
      "mise"
      "watchman"
      "wealthsimple/tap/wolfman"
      "yq"
    ];
  };

  # Local PostgreSQL (only accessible on this machine)
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_16;
  };
}
