{ config, pkgs, ... }:

{
  imports = [
    ./options.nix
    ./finder.nix
    ./dock.nix
    ./apps.nix
  ];

  homebrew.enable = true;
}
