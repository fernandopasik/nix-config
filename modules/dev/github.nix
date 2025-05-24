{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # cli
    gh

    # github actions
    act
  ];
}
