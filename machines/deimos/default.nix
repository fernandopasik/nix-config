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
    ../../hardware/surface
    ../../os/linux
    ../../modules/nix
    ../../modules/system
    ../../modules/shell
    ../../modules/dev
    ../../modules/games
    ../../users/fernando
  ];

  networking.hostName = "deimos";

  programs.nix-ld = {
    enable = true;
    package = pkgs.nix-ld;
  };

  apps = [
    "1password"
    "chatgpt"
    "claude"
    "chromium"
    "deluge"
    "firefox"
    "freetube"
    "gemini"
    "google-chrome"
    "google-drive"
    "librewolf"
    "microsoft-edge"
    "raspberry-pi-imager"
    "signal"
    "spotify"
    "vlc"
    "wireshark"
    "yubikey"
    "whatsapp"
  ];
}
