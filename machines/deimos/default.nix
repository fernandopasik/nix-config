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
    ../../modules/dev-tools/darwin.nix
    ../../modules/docker/darwin.nix
    ../../modules/apps/darwin.nix
    ../../modules/games/darwin.nix
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
