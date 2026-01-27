{ config, pkgs, ... }:

{
  imports = [
    ./apple.nix
    ./compression.nix
    ./google-chrome.nix
    ./google-drive.nix
    ./hardware.nix
    ./other.nix
    ./security.nix
    ./spotify.nix
    ./vlc.nix
    ./ai.nix
  ];
}
