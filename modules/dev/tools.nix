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
      claude-code
      gemini-cli
      imagemagick
      neovim
      tree-sitter
      watchman
    ];

    apps = [ "vscode" ];
  }

  (lib.optionalAttrs isDarwin {
    environment.systemPackages = with pkgs; [
      ghostty-bin
      utm
    ];

    homebrew = {
      casks = [ "font-ubuntu-mono-nerd-font" ];
      masApps = {
        Xcode = 497799835;
      };
    };

    system.defaults.dock.persistent-apps = [ "/Applications/Ghostty.app" ];
  })

  (lib.optionalAttrs (isLinux && isHeadless) { environment.systemPackages = with pkgs; [ ghostty ]; })

  (lib.optionalAttrs isWSL { winget.packages = [ "DEVCOM.JetBrainsMonoNerdFont" ]; })
]
