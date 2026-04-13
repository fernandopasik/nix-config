{ config, pkgs, ... }:

{
  imports = [
    ./apple.nix
    ./compression.nix
    ./hardware.nix
    ./other.nix
    ./security.nix
  ];
}
