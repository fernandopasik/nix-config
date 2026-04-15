{
  config,
  isHeadless,
  lib,
  pkgs,
  ...
}:
lib.mkMerge [
  {
    i18n = {
      defaultLocale = "en_GB.UTF-8";
      extraLocaleSettings = {
        LC_ALL = "en_GB.UTF-8";
      };
    };

    services = {
      getty.autologinUser = null;
      openssh.enable = true;
    };
  }
  (lib.optionalAttrs (!isHeadless) {
    networking.networkmanager = {
      enable = true;
      dns = "systemd-resolved";
    };

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    services = {
      resolved.enable = true;
      printing.enable = true;
      xserver.enable = true;
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
    };

  })
]
