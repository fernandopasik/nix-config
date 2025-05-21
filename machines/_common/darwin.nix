{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [ ../../modules/macos/options.nix ];

  homebrew.enable = true;

  homebrew.casks = [
    # Essentials
    "google-chrome"
    "google-drive"
    "spotify"
    "stats"
    "the-unarchiver"
    "vlc"

    # Chat
    "whatsapp"
    "zoom"

    # QuickLook plugins
    "qlcolorcode"
    "qlmarkdown"
    "qlstephen"
    "quicklook-csv"
    "quicklook-json"
    "webpquicklook"
  ];

  system = {
    activationScripts.postActivation.text = ''
      echo "🧹 Removing background services..."
      rm -f /Library/LaunchDaemons/us.zoom.*
      rm -f /Library/LaunchAgents/us.zoom.*
      rm -f /Library/LaunchAgents/com.gog.*
    '';

    primaryUser = "fernando";

    stateVersion = 6;
  };
}
