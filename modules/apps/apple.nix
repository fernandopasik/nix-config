{
  config,
  isDarwin,
  isWSL,
  pkgs,
  lib,
  ...
}:
lib.mkMerge [
  (lib.optionalAttrs isWSL {
    winget.packages = [
      "9NP83LWLPZ9K" # Apple Devices
      "9PKTQ5699M62" # Apple iCloud
    ];
  })
]
