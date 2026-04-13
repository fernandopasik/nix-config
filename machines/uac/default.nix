{
  config,
  homeManagerModule,
  pkgs,
  wslModule,
  ...
}:

{
  imports = [
    wslModule
    homeManagerModule
    ../../apps
    ../../modules/windows
    ../../modules/nix
    ../../modules/system
    ../../modules/shell
    ../../modules/apps
    ../../modules/dev
    ../../modules/wsl
    ../../modules/games
    ../../users/fernando
  ];

  networking.hostName = "uac";

  programs.nix-ld = {
    enable = true;
    package = pkgs.nix-ld;
  };

  apps = [
    "apple-devices"
    "apple-icloud"
    "chatgpt"
    "claude"
    "discord"
    "freetube"
    "google-chrome"
    "google-drive"
    "signal"
    "spotify"
    "vlc"
    "whatsapp"
  ];
}
