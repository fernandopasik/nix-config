{ config, pkgs, ... }:

{
  services.getty.autologinUser = null;
  services.openssh.enable = true;
}
