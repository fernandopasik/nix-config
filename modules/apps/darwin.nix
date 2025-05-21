{ config, pkgs, ... }:

{
  homebrew.casks = [
    # Essentials
    "google-chrome"
    "google-drive"
    "spotify"
    "stats"
    "the-unarchiver"
    "vlc"

    # Chat
    "signal"

    # Others
    "nordvpn"
    "transmission"
  ];
}
