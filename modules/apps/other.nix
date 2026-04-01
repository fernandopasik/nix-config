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
      "deluge"
      "freetube"
      "raspberry-pi-imager"
    ];
  })

  (lib.optionalAttrs (isLinux && !isWSL) {
    environment.systemPackages = with pkgs; [
      deluge
      freetube
      rpi-imager
    ];
  })

  (lib.optionalAttrs isWSL {
    winget.packages = [
      "DelugeTeam.Deluge"
      "FreeTube.FreeTube"
      "RaspberryPiFoundation.RaspberryPiImager"
      "Romanitho.Winget-AutoUpdate"
      "Rufus.Rufus"
    ];
  })
]
