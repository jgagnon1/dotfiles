{ ... }:

{
  # Homebrew — manages casks (GUI apps) not available in nixpkgs
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "zap"; # Remove casks no longer listed here
    };
    brews = [
      "colima"
      "docker"
    ];
    casks = [
      { name = "ghostty"; }
      { name = "claude"; }
      { name = "spotify"; }
    ];
  };
}
