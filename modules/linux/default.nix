{ config, pkgs, ... }:

{
  boot.loader.grub.enable = false;
  services.getty.autologinUser = null;
  services.openssh.enable = true;
}
