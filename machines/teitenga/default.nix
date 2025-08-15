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

  programs.nix-ld = {
    enable = true;
    package = pkgs.nix-ld-rs;
  };
}
