{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    git-lfs
  ];
}
