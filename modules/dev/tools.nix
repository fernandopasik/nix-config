{
  config,
  isDarwin,
  lib,
  pkgs,
  ...
}:
lib.mkMerge [
  (lib.optionalAttrs isDarwin {
    homebrew = {
      casks = [
        # IDE
        "visual-studio-code"
        "ghostty"

        # Fonts
        "font-jetbrains-mono"

        # Chat
        "slack"
        "notion"
      ];

      masApps = {
        Xcode = 497799835;
      };
    };
  })
]
