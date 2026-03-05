{ ... }:

{
  # Homebrew — manages casks (GUI apps) not available in nixpkgs
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "zap"; # Remove casks no longer listed here
    };
    casks = [
      { name = "ghostty"; }
      { name = "claude"; }
      { name = "spotify"; }
    ];
  };
}
