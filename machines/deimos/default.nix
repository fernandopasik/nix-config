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
    ../../modules/macos
    ../../modules/system
    ../../modules/shell
    ../../modules/apps
    ../../modules/dev
    ../../modules/macos/more-apps.nix
    ../../modules/games
    ../../modules/chat
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
