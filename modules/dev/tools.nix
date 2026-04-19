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
    environment.systemPackages =
      with pkgs;
      [
        claude-code
        gemini-cli
        imagemagick
        neovim
        nerd-fonts.ubuntu-mono
        tree-sitter
        watchman
      ]
      ++ lib.optionals isDarwin [ utm ];

    apps = [
      "ghostty"
      "vscode"
    ];
  }
  (lib.optionalAttrs isWSL { winget.packages = [ "DEVCOM.JetBrainsMonoNerdFont" ]; })
]
