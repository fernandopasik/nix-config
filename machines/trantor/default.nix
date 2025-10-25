{
  config,
  homeManagerModule,
  pkgs,
  ...
}:

{
  imports = [
    homeManagerModule
    ../../modules/nix
    ../../modules/linux
    ../../modules/raspberrypi
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
}
