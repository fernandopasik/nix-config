{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Other Programming languages
    go
    rustc
  ];
}
