{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    rbenv
    ruby
  ];

  programs.zsh.promptInit = ''
    export PATH="${pkgs.rbenv}/bin:$PATH"
    eval "$(rbenv init -)"
  '';
}
