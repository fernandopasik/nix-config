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
    ../../apps
    ../../modules/nix
    ../../modules/macos
    ../../modules/system
    ../../modules/shell
    ../../modules/apps/google-chrome.nix
    ../../modules/apps/compression.nix
    ../../modules/dev
    ../../modules/dev/android.nix
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

  apps = [
    "chatgpt"
    "claude"
    "gemini"
    "google-chrome"
    "google-drive"
    "notion"
    "slack"
    "teams"
    "zoom"
  ];
}
