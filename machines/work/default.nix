{
  config,
  homeManagerModule,
  pkgs,
  ...
}:
let
  hostname = "Work";
in
{
  imports = [
    homeManagerModule
    ../../modules/nix
    ../../modules/macos
    ../../modules/system
    ../../modules/shell
    ../../modules/apps/google-chrome.nix
    ../../modules/apps/google-drive.nix
    ../../modules/dev
    ../../modules/chat/slack.nix
    ../../modules/chat/zoom.nix
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
