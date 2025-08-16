{
  config,
  homeManagerModule,
  pkgs,
  ...
}:

{
  imports = [
    homeManagerModule
    ../../modules/raspberrypi
    ../../modules/nix
    ../../modules/system
    ../../modules/shell
    ../../users/fernando
  ];

  networking.hostName = "teitenga";

  swapDevices = [
    {
      device = "/mnt/usb/swapfile";
      size = 2048;
    }
  ];

  programs.nix-ld = {
    enable = true;
    package = pkgs.nix-ld-rs;
  };
}
