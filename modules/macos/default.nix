{ config, pkgs, ... }:

{
  imports = [
    ./options.nix
    ./finder.nix
    ./dock.nix
    ./apps.nix
  ];

  homebrew.enable = true;

  programs.zsh.promptInit = ''
    export PATH="/opt/homebrew/bin:$PATH"
  '';
}
