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
    homebrew.casks = [ "notion" ];

    system.defaults.dock.persistent-apps = [ "/Applications/Notion.app" ];
  })

  (lib.optionalAttrs isWSL { winget.packages = [ "Notion.Notion" ]; })
]
