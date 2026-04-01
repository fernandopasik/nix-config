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
    ../../modules/surface
    ../../modules/system
    ../../users/fernando
  ];

  networking.hostName = "deimos";

  programs.nix-ld = {
    enable = true;
    package = pkgs.nix-ld;
  };
}
