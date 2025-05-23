{ config, pkgs, ... }:

{
  imports = [
    ./options
    ./finder
    ./dock
  ];
}
