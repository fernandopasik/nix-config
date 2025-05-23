{
  config,
  homeManagerModule,
  pkgs,
  wslModule,
  ...
}:

{
  imports = [
    wslModule
    homeManagerModule
    ../../modules/nix
    ../../modules/system
    ../_common/linux.nix
    ../../modules/shell
    ../../modules/dev
    ../../modules/wsl
    ../../users/fernando
  ];

  networking.hostName = "uac";

  programs.nix-ld = {
    enable = true;
    package = pkgs.nix-ld-rs;
  };
}
