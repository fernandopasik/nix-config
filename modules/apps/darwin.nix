{ config, pkgs, ... }:

{
  homebrew.casks = [
    # Chat
    "signal"

    # Others
    "1password"
    "nordvpn"
    "tg-pro"
    "transmission"
  ];
}
