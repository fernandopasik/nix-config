{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    rbenv
    ruby
  ];

  programs.zsh.promptInit = ''
    eval "$(rbenv init -)"
  '';
}
