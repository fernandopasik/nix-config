{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ lsb-release ];

  security.sudo.enable = true;
  system.stateVersion = "25.05";
}
