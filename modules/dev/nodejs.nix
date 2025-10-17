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
    nodejs_24.pkgs.npm
    nodejs_24.pkgs.npm-check-updates
    nodejs_24.pkgs.yo
  ];

  programs.zsh.promptInit = ''
    export VOLTA_HOME="$HOME/.volta";
    export PATH="$VOLTA_HOME/bin:$PATH"
  '';
}
