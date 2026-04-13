{ config, pkgs, ... }:

{
  boot = {
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
    };

    kernelPackages = pkgs.linuxPackages_rpi4;
  };

  environment.systemPackages = with pkgs; [
    raspberrypi-eeprom
    raspberrypifw
  ];

  fileSystems."/firmware" = {
    device = "/dev/disk/by-label/FIRMWARE";
    fsType = "vfat";
  };

  fileSystems."/" = {
    device = "/dev/disk/by-label/NIXOS_SD";
    fsType = "ext4";
  };

  hardware.enableRedistributableFirmware = true;
}
