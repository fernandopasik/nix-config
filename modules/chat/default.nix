{ config, pkgs, ... }:

{
  imports = [
    ./discord.nix
    ./slack.nix
    ./whatsapp.nix
    ./zoom.nix
  ];
}
