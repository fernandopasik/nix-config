{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Ruby
    rbenv
    ruby

    # Other Programming languages
    go
    rustc
    jdk
  ];
}
