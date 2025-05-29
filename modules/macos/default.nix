{ config, pkgs, ... }:

{
  imports = [
    ./options.nix
    ./finder.nix
    ./dock.nix
  ];

  homebrew.enable = true;

  programs.zsh.shellInit = ''
    export PATH="/opt/homebrew/bin:$PATH"
  '';
}
