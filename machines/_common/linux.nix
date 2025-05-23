{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ lsb-release ];

  security.sudo.enable = true;
}
