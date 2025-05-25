{ config, pkgs, ... }:

{
  imports = [
    ./git.nix
    ./github.nix
    ./nodejs.nix
    ./python.nix
    ./ruby.nix
    ./java.nix
    ./languages.nix
    ./docker.nix
    ./infrastructure.nix
    ./browsers.nix
    ./tools.nix
    ./android.nix
  ];
}
