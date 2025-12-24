{
  config,
  isDarwin,
  isWSL,
  lib,
  pkgs,
  ...
}:
lib.mkMerge [
  (lib.optionalAttrs isDarwin {
    homebrew.casks = [ "whatsapp" ];
    system.defaults.dock.persistent-apps = [ "/Applications/whatsapp.app" ];
  })

  (lib.optionalAttrs isWSL {
    winget.packages = [
      "9NKSQGP7F2NH" # WhatsApp
    ];
  })
]
