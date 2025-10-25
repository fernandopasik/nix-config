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
    ../../modules/apps/compression.nix
    ../../modules/apps/notion.nix
    ../../modules/chat/zoom.nix
    ../../modules/chat/slack.nix
    ../../modules/dev
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
