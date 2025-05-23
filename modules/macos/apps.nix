{ config, pkgs, ... }:
{
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
  ];

  system = {
    activationScripts.postActivation.text = ''
      echo "🧹 Removing background services..."
      rm -f /Library/LaunchDaemons/us.zoom.*
      rm -f /Library/LaunchAgents/us.zoom.*
    '';
  };
}
