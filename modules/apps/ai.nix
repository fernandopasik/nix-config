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
    homebrew.casks = [ "chatgpt" ];

    system.defaults.dock.persistent-apps = [ "/Applications/ChatGPT.app" ];
  })

  (lib.optionalAttrs isWSL { winget.packages = [ "9nt1r1c2hh7j" ]; })
]
