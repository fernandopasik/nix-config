{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    rbenv
    ruby
  ];

  programs.zsh.promptInit = ''
    export PATH="${pkgs.rbenv}/bin:$PATH"
    if [[ ! -d "$(rbenv root)/plugins/ruby-build" ]]; then
      git clone --quiet https://github.com/rbenv/ruby-build.git "$(rbenv root)/plugins/ruby-build"
    fi
    eval "$(rbenv init -)"
  '';
}
