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
    apps = [
      "ghostty"
      "vscode"
      "apple-xcode"
    ];
  }

  (lib.optionalAttrs isDarwin {
    environment.systemPackages = with pkgs; [ utm ];
    homebrew = {
      casks = [ "font-ubuntu-mono-nerd-font" ];
    };
  })

  (lib.optionalAttrs isWSL { winget.packages = [ "DEVCOM.JetBrainsMonoNerdFont" ]; })
]
