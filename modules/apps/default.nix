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
      "signal"

      # Others
      "1password"
      "nordvpn"
      "tg-pro"
      "transmission"
    ];
  })
]
