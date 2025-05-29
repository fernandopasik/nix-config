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
  (lib.optionalAttrs isDarwin { homebrew.casks = [ "signal" ]; })

  (lib.optionalAttrs isWSL {
    system.activationScripts.postActivation.text = libx.installWingetPkgs [
      "OpenWhisperSystems.Signal"
    ];
  })
]
