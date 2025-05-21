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
    "discord"
    "signal"

    # Games
    "battle-net"
    "epic-games"
    "gog-galaxy"
    "minecraft"
    "openemu@experimental"
    "steam"

    # Others
    "nordvpn"
    "transmission"
  ];
}
