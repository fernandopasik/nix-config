{ config, pkgs, ... }:

{
  imports = [
    ./options
    ./finder
    ./dock
    ./apps
  ];

  homebrew.enable = true;
}
