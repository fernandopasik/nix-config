{
  config,
  isDarwin,
  isHeadless,
  isLinux,
  isWSL,
  lib,
  pkgs,
  ...
}:
lib.mkMerge [
  {
    environment.systemPackages = with pkgs; [
      imagemagick
      neovim
      watchman
      tree-sitter
    ];
  }

  (lib.optionalAttrs isDarwin {
    environment.systemPackages = with pkgs; [
      ghostty-bin
      utm
    ];

    homebrew = {
      casks = [
        # IDE
        "visual-studio-code"

        # Fonts
        "font-ubuntu-mono-nerd-font"
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

  (lib.optionalAttrs (isLinux && isHeadless) { environment.systemPackages = with pkgs; [ ghostty ]; })

  (lib.optionalAttrs isWSL {
    winget.packages = [
      "Microsoft.VisualStudioCode"
      "DEVCOM.JetBrainsMonoNerdFont"
    ];
  })
]
