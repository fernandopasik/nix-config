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
  (lib.optionalAttrs isDarwin {
    homebrew.casks = [ "whatsapp" ];
    system.defaults.dock.persistent-apps = [ "/Applications/whatsapp.app" ];
  })

  (lib.optionalAttrs isWSL {
    system.activationScripts.postActivation.text = libx.installWingetPkgs [
      "9NKSQGP7F2NH" # WhatsApp
    ];
  })
]
