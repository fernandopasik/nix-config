{ config, pkgs, ... }:

{
  imports = [
    ./git.nix
    ./github.nix
    ./languages.nix
    ./nodejs.nix
    ./python.nix
    ./ruby.nix
    ./docker.nix
    ./infrastructure.nix
    ./browsers.nix
    ./tools.nix
  ];
}
