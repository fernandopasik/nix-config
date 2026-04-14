{ config, pkgs, ... }:

{
  imports = [
    ./compression.nix
    ./hardware.nix
    ./other.nix
  ];
}
