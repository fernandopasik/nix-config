{ config, pkgs, ... }:

{
  imports = [
    ./discord.nix
    ./signal.nix
    ./slack.nix
    ./teams.nix
    ./whatsapp.nix
    ./zoom.nix
  ];
}
