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
    ../../modules/hardware
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
    "apple-notes"
    "apple-xcode"
    "chatgpt"
    "claude"
    "firefox"
    "gemini"
    "google-chrome"
    "google-drive"
    # "librewolf"
    "microsoft-edge"
    "notion"
    "slack"
    "teams"
    "wireshark"
    "yubikey"
    "zoom"
  ];
}
