{
  config,
  isDarwin,
  isWSL,
  lib,
  libx,
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
    system.activationScripts.postActivation.text = libx.installWingetPkgs [
      {
        name = "Blizzard.BattleNet";
        location = "C:\\Program Files (x86)\\Battle.net\\";
      }
      "EpicGames.EpicGamesLauncher"
      "GOG.Galaxy"
      "Mojang.MinecraftLauncher"
      "Valve.Steam"
    ];
  })
]
