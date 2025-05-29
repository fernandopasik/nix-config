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
    ../../modules/google
    ../../modules/shell
    ../../modules/dev
    ../../modules/wsl
    ../../modules/games
    ../../modules/chat
    ../../users/fernando
  ];

  networking.hostName = "uac";

  programs.nix-ld = {
    enable = true;
    package = pkgs.nix-ld-rs;
  };
}
