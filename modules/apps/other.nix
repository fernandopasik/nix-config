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
      "raspberry-pi-imager"
      "transmission"
    ];
  })

  (lib.optionalAttrs isWSL {
    winget.packages = [
      "RaspberryPiFoundation.RaspberryPiImager"
      "Romanitho.Winget-AutoUpdate"
      "Rufus.Rufus"
      "Transmission.Transmission"
    ];
  })
]
