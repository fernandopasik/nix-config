{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ go ];

  programs.zsh.promptInit = ''
    export GOPATH=$HOME/.local/go
    export PATH="$PATH:$GOPATH/bin"
  '';
}
