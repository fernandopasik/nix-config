{ config, pkgs, ... }:

{
  homebrew.casks = [
    # Chat
    "discord"

    # Games
    "battle-net"
    "epic-games"
    "gog-galaxy"
    "minecraft"
    "openemu@experimental"
    "steam"
  ];
}
