{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # git and github
    git
    git-lfs
    gh
    act
  ];
}
