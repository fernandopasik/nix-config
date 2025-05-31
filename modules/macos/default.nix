{ config, pkgs, ... }:

{
  imports = [
    ./options.nix
    ./finder.nix
    ./dock.nix
    ./menu-bar.nix
  ];

  homebrew.enable = true;

  programs.zsh.shellInit = ''
    export PATH="/opt/homebrew/bin:$PATH"
  '';
}
