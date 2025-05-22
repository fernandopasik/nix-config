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
  })
]
