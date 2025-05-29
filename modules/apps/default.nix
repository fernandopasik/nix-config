{ config, pkgs, ... }:

{
  imports = [
    ./apple.nix
    ./compression.nix
    ./google-chrome.nix
    ./google-drive.nix
    ./other.nix
    ./spotify.nix
    ./vlc.nix
  ];
}
