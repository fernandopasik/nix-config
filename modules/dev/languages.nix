{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Other Programming languages
    go
    ruby
    rustc
    jdk
  ];
}
