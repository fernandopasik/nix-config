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
  {
    environment.systemPackages = with pkgs; [
      qemu
      watchman
    ];
  }

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
  })

  (lib.optionalAttrs isWSL {
    system.activationScripts.postActivation.text = libx.installWingetPkgs [
      "Microsoft.VisualStudioCode"
      "DEVCOM.JetBrainsMonoNerdFont"
    ];
  })
]
