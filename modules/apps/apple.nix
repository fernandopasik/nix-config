{
  config,
  isDarwin,
  isWSL,
  pkgs,
  lib,
  libx,
  ...
}:
lib.mkMerge [
  (lib.optionalAttrs isWSL {
    system.activationScripts.postActivation.text = libx.installWingetPkgs [
      "9NP83LWLPZ9K" # Apple Devices
      "9PKTQ5699M62" # Apple iCloud
    ];
  })
]
