{ config, pkgs, ... }:

{
  imports = [
    ./google-chrome.nix
    ./google-drive.nix
    ./spotify.nix
    ./vlc.nix
  ];
}
