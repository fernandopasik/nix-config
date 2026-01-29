{
  config,
  isDarwin,
  isWSL,
  lib,
  pkgs,
  ...
}:
lib.mkMerge [
  {
    environment.systemPackages = with pkgs; [
      neovim
      watchman
      tree-sitter
    ];
  }

  (lib.optionalAttrs isDarwin {
    environment.systemPackages = with pkgs; [ utm ];

    homebrew = {
      casks = [
        # IDE
        "visual-studio-code"
        "ghostty"
        "neovim"
        "tree-sitter"
        "tree-sitter-cli"

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

  (lib.optionalAttrs isWSL {
    winget.packages = [
      "Microsoft.VisualStudioCode"
      "DEVCOM.JetBrainsMonoNerdFont"
    ];
  })
]
