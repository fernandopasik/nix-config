{
  config,
  isDarwin,
  isLinux,
  isWSL,
  pkgs,
  lib,
  ...
}:
lib.mkMerge [
  (lib.optionalAttrs isDarwin {
    homebrew.casks = [
      "chatgpt"
      "claude"
    ];

    system.defaults.dock.persistent-apps = [
      "/Applications/ChatGPT.app"
      "/Applications/Claude.app"
    ];
  })

  (lib.optionalAttrs isWSL {
    winget.packages = [
      "Anthropic.Claude"
      "9nt1r1c2hh7j"
    ];
  })
]
