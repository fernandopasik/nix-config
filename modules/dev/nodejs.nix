{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Runtimes
    nodejs_24
    bun
    deno

    # Package Managers
    corepack_24
    volta

    # Packages
    nodePackages_latest.npm
    nodePackages_latest.npm-check-updates
    nodePackages_latest.yo
  ];

  programs.zsh.promptInit = ''
    export VOLTA_HOME="$HOME/.volta";
    export PATH="$VOLTA_HOME/bin:$PATH"
  '';
}
