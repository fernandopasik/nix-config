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
    ../../os/windows
    ../../os/wsl
    ../../modules/nix
    ../../modules/system
    ../../modules/shell
    ../../modules/hardware
    ../../modules/dev
    ../../modules/games
    ../../users/fernando
  ];

  networking.hostName = "uac";

  programs.nix-ld = {
    enable = true;
    package = pkgs.nix-ld;
  };

  apps = [
    "1password"
    "7zip"
    "android-studio"
    "apple-devices"
    "apple-icloud"
    "chatgpt"
    "claude"
    "chromium"
    "deluge"
    "discord"
    "firefox"
    "freetube"
    "google-chrome"
    "google-drive"
    "librewolf"
    "microsoft-edge"
    "nordvpn"
    "raspberry-pi-imager"
    "rufus"
    "signal"
    "spotify"
    "vlc"
    "whatsapp"
    "wireshark"
    "yubikey"
  ];
}
