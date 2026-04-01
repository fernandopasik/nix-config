{ config, pkgs, ... }:

{
  i18n = {
    defaultLocale = "en_GB.UTF-8";
    extraLocaleSettings = {
      LC_ALL = "en_GB.UTF-8";
    };
  };

  networking.networkmanager = {
    enable = true;
    dns = "systemd-resolved";
  };

  services = {
    getty.autologinUser = null;
    openssh.enable = true;
    resolved.enable = true;
  };
}
