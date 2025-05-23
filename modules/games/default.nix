{
  config,
  isDarwin,
  lib,
  pkgs,
  ...
}:
lib.mkMerge [
  (lib.optionalAttrs isDarwin {
    homebrew.casks = [
      # Chat
      "discord"

      # Games
      "battle-net"
      "epic-games"
      "gog-galaxy"
      "minecraft"
      "openemu@experimental"
      "steam"
    ];

    system.activationScripts.postActivation.text = ''
      echo "🧹 Removing GOG background service..."
      rm -f /Library/LaunchAgents/com.gog.*
    '';
  })
]
