{
  config,
  homeManagerModule,
  pkgs,
  ...
}:

{
  imports = [
    homeManagerModule
    ../../apps
    ../../modules/nix
    ../../modules/linux
    ../../modules/linux/gnome.nix
    ../../modules/surface
    ../../modules/system
    ../../modules/shell
    ../../modules/dev
    ../../modules/apps
    ../../modules/games
    ../../users/fernando
  ];

  networking.hostName = "deimos";

  programs.nix-ld = {
    enable = true;
    package = pkgs.nix-ld;
  };

  apps = [
    "chatgpt"
    "claude"
    "freetube"
    "gemini"
    "google-chrome"
    "google-drive"
    "signal"
    "spotify"
    "vlc"
    "whatsapp"
  ];
}
