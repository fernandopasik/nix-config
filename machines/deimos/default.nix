{
  config,
  homeManagerModule,
  pkgs,
  ...
}:
let
  hostname = "Deimos";
in
{
  imports = [
    homeManagerModule
    ../_common
    ../_common/darwin.nix
    ../../modules/shell
    ../../modules/dev-tools
    ../../modules/dev
    ../../modules/docker/darwin.nix
    ../../modules/apps
    ../../modules/games
    ../../users/fernando
    ../../users/fernando/darwin.nix
  ];

  networking = {
    hostName = hostname;
    computerName = hostname;
    localHostName = hostname;
  };

  system = {
    defaults = {
      smb = {
        NetBIOSName = hostname;
        ServerDescription = hostname;
      };
    };
  };
}
