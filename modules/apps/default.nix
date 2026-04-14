{ config, pkgs, ... }:

{
  imports = [
    ./hardware.nix
    ./other.nix
  ];
}
