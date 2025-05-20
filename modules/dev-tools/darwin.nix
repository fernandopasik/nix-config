{ config, pkgs, ... }:

{
  homebrew.casks = [
    # IDE
    "visual-studio-code"
    "ghostty"

    # Fonts
    "font-jetbrains-mono"

    # Browsers
    "firefox"
    "microsoft-edge"

    # Chat
    "slack"
  ];
}
