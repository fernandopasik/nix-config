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
      "freetube"
      "raspberry-pi-imager"
      "transmission"
    ];
  })

  (lib.optionalAttrs isWSL {
    winget.packages = [
      "FreeTube.FreeTube"
      "RaspberryPiFoundation.RaspberryPiImager"
      "Romanitho.Winget-AutoUpdate"
      "Rufus.Rufus"
      "Transmission.Transmission"
    ];
  })
]
