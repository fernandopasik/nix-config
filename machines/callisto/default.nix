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
    ../../apps
    ../../modules/nix
    ../../modules/macos
    ../../modules/system
    ../../modules/shell
    ../../modules/apps
    ../../modules/dev
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

  apps = [
    "apple-facetime"
    "apple-messages"
    "apple-notes"
    "chatgpt"
    "claude"
    "gemini"
    "google-chrome"
    "google-drive"
    "slack"
    "spotify"
    "vlc"
    "whatsapp"
    "yubikey"
    "zoom"
  ];
}
