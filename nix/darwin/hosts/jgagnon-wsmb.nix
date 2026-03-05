{ ... }:

{
  imports = [ ../configuration.nix ];

  networking.hostName = "jgagnon-wsmb";

  # Leave /etc/zshrc, /etc/zshenv, /etc/zprofile to the company MDM tool
  programs.zsh.enable = false;
}
