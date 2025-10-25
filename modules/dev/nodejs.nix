{ config, pkgs, ... }:

let
  node24Overlay = final: prev: {
    nodejs = prev.nodejs_24;
    nodePackages = prev.nodePackages.override { nodejs = prev.nodejs_24; };
  };
in
{
  nixpkgs.overlays = [ node24Overlay ];

  environment.systemPackages = with pkgs; [
    # Runtimes
    nodejs
    bun
    deno

    # Package Managers
    corepack_24
    volta

    # Packages
    nodePackages.npm
    nodePackages.npm-check-updates
    nodePackages.yo
  ];

  programs.zsh.promptInit = ''
    export VOLTA_HOME="$HOME/.volta";
    export PATH="$VOLTA_HOME/bin:$PATH"
  '';
}
