{ config, pkgs, ... }:

{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  fileSystems."/" = {
    device = "/dev/disk/by-label/root";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-label/EFI";
    fsType = "vfat";
  };

  swapDevices = [ { device = "/dev/disk/by-label/swap"; } ];

  hardware = {
    enableRedistributableFirmware = true;
    graphics.enable = true;
    sensor.iio.enable = true;
  };

  security.rtkit.enable = true;

  services = {
    pipewire = {
      alsa.enable = true;
      alsa.support32Bit = true;
      audio.enable = true;
      enable = true;
      pulse.enable = true;
    };

    printing.enable = true;

    pulseaudio.enable = false;

    libinput.enable = true;
  };
}
