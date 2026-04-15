{
  config,
  homeManagerModule,
  pkgs,
  ...
}:

{
  imports = [
    homeManagerModule
    ../../apps
    ../../hardware/raspberrypi
    ../../os/linux
    ../../modules/nix
    ../../modules/system
    ../../modules/shell
    ../../modules/dev/docker.nix
    ../../services
    ../../users/fernando
  ];

  networking.hostName = "trantor";

  programs.nix-ld = {
    enable = true;
    package = pkgs.nix-ld;
  };

  apps = [ "yubikey" ];
}
