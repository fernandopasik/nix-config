{
  config,
  lib,
  pkgs,
  ...
}:

{
  boot = {
    extraModulePackages = [ ];
    initrd = {
      availableKernelModules = [
        "xhci_pci"
        "nvme"
        "usb_storage"
        "sd_mod"
      ];
      kernelModules = [ ];
    };
    kernelModules = [ "kvm-intel" ];

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  environment.systemPackages = with pkgs; [
    libinput
    evtest
    surface-control
  ];

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
    cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    enableRedistributableFirmware = true;
    graphics.enable = true;
    microsoft-surface.kernelVersion = "longterm";
    sensor.iio.enable = true;
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  security.rtkit.enable = true;

  services = {
    libinput.enable = true;

    pipewire = {
      alsa.enable = true;
      alsa.support32Bit = true;
      audio.enable = true;
      enable = true;
      pulse.enable = true;
    };
    pulseaudio.enable = false;
    thermald.enable = true;
  };
}
