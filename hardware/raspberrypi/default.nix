{
  config,
  lib,
  pkgs,
  ...
}:

{
  boot = {
    kernel.sysctl = {
      "vm.mmap_rnd_bits" = lib.mkForce 32;
    };
    kernelPackages = pkgs.linuxPackages_rpi4;
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
    };
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
