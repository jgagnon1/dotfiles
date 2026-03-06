{ ... }:

{
  xdg.configFile."ghostty/config".text = ''
    # See: https://ghostty.org/docs/config/reference
    # and: ghostty +list-themes
    theme = dark:Catppuccin Mocha,light:Catppuccin Latte

    font-family = FiraCode Nerd Font Mono
    font-size = 16
    font-thicken = false

    # Scroll on macos with external mouse is way too fast
    mouse-scroll-multiplier = 0.25

    # Parses URLs to allow click
    link-url = true

    # Fixes ctrl-alt keybindings (for fish)
    macos-option-as-alt = true

    # Unbind alt-left/right to make it work with fish
    keybind = alt+left=unbind
    keybind = alt+right=unbind

    # Don't show quit confirmation dialog on close
    confirm-close-surface = false

    # Because ghostty isn't well known and causes color issues
    term = xterm-256color
  '';
}
