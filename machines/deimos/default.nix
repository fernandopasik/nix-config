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
    ../../modules/nix
    ../../modules/system
    ../../modules/shell
    ../../modules/dev
    ../../modules/apps
    ../../modules/games
    ../../users/fernando
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

    primaryUser = "fernando";
  };
}
