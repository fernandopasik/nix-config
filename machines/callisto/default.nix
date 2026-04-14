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
    ../../os/macos
    ../../modules/nix
    ../../modules/system
    ../../modules/shell
    ../../modules/hardware
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
    "1password"
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
