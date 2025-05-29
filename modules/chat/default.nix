{ config, pkgs, ... }:

{
  imports = [
    ./discord.nix
    ./signal.nix
    ./slack.nix
    ./whatsapp.nix
    ./zoom.nix
  ];
}
