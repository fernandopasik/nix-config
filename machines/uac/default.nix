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
    ../_common
    ../_common/linux.nix
    ../../modules/shell
    ../../modules/dev-tools
    ../../modules/dev
    ../../modules/docker/linux.nix
    ../../modules/wsl
    ../../users/fernando
    ../../users/fernando/linux.nix
  ];

  networking.hostName = "uac";

  programs.nix-ld = {
    enable = true;
    package = pkgs.nix-ld-rs;
  };
}
