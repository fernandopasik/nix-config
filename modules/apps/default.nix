{ config, pkgs, ... }:

{
  imports = [
    ./compression.nix
    ./google-chrome.nix
    ./google-drive.nix
    ./other.nix
    ./spotify.nix
    ./vlc.nix
  ];
}
