{
  config,
  hardwareModule,
  lib,
  pkgs,
  ...
}:

let
  acpiOverride = pkgs.runCommand "acpi-override" { } ''
    mkdir -p $out/kernel/firmware/acpi
    cp ${./dsdt.aml} $out/kernel/firmware/acpi/dsdt.aml
    cd $out
    find kernel | ${pkgs.cpio}/bin/cpio -H newc --create > $out/acpi_override
  '';
in
{
  imports = [ hardwareModule.nixosModules.microsoft-surface-pro-intel ];

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
      prepend = [ "${acpiOverride}/acpi_override" ];
    };
    kernelModules = [ "kvm-intel" ];
    kernelParams = [ "mem_sleep_default=deep" ];

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
    graphics = {
      enable = true;
      extraPackages = with pkgs; [ intel-media-driver ];
    };
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
