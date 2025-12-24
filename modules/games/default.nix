{
  config,
  isDarwin,
  isWSL,
  lib,
  pkgs,
  ...
}:
lib.mkMerge [
  (lib.optionalAttrs isDarwin {
    homebrew.casks = [
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

  (lib.optionalAttrs isWSL {
    winget.packages = [
      {
        name = "Blizzard.BattleNet";
        location = "C:\\Program Files (x86)\\Battle.net\\";
      }
      "EpicGames.EpicGamesLauncher"
      "GOG.Galaxy"
      "Valve.Steam"
    ];
  })
]
