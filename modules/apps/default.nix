{ config, pkgs, ... }:

{
  imports = [
    ./ai.nix
    ./apple.nix
    ./compression.nix
    ./google-chrome.nix
    ./hardware.nix
    ./other.nix
    ./security.nix
    ./vlc.nix
  ];
}
