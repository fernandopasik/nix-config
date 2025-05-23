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
        "android-commandlinetools"
        "android-platform-tools"
        "android-studio"

        # Fonts
        "font-jetbrains-mono"

        # Chat
        "slack"
      ];

      masApps = {
        Xcode = 497799835;
      };
    };
  })
]
