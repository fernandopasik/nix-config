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
    ../../modules/system
    ../../modules/shell
    ../../users/fernando
  ];

  networking.hostName = "teitenga";
}
