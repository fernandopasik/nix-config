{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Runtimes
    nodejs_24
    bun
    deno

    # Package Managers
    corepack_24

    # Packages
    nodePackages.npm
    nodePackages.npm-check-updates
    nodePackages.yo
  ];
}
