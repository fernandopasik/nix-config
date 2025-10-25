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
  { environment.systemPackages = with pkgs; [ watchman ]; }

  (lib.optionalAttrs isDarwin {
    environment.systemPackages = with pkgs; [ utm ];

    homebrew = {
      casks = [
        # IDE
        "visual-studio-code"
        "ghostty"

        # Fonts
        "font-jetbrains-mono"
      ];

      masApps = {
        Xcode = 497799835;
      };
    };

    system.defaults.dock.persistent-apps = [
      "/Applications/Visual Studio Code.app"
      "/Applications/Ghostty.app"
    ];
  })

  (lib.optionalAttrs isWSL {
    system.activationScripts.postActivation.text = libx.installWingetPkgs [
      "Microsoft.VisualStudioCode"
      "DEVCOM.JetBrainsMonoNerdFont"
    ];
  })
]
