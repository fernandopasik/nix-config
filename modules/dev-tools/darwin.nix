{ config, pkgs, ... }:

{
  homebrew.casks = [
    # IDE
    "visual-studio-code"
    "ghostty"

    # Fonts
    "font-jetbrains-mono"

    # Chat
    "slack"
  ];
}
