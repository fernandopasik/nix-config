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
    nodePackages_latest.npm
    nodePackages_latest.npm-check-updates
    nodePackages_latest.yo
  ];
}
