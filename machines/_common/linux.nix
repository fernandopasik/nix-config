{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ lsb-release ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 5";
  };

  security.sudo.enable = true;
  system.stateVersion = "25.05";
}
