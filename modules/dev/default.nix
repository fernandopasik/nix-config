{ config, pkgs, ... }:

{
  imports = [
    ./git.nix
    ./github.nix
    ./languages.nix
    ./nodejs.nix
    ./python.nix
    ./docker.nix
    ./infrastructure.nix
    ./browsers.nix
    ./tools.nix
  ];
}
