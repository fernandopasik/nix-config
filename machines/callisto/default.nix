{
  config,
  homeManagerModule,
  pkgs,
  ...
}:
let
  hostname = "Callisto";
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
