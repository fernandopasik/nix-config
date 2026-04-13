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
      "raspberry-pi-imager"
    ];
  })

  (lib.optionalAttrs (isLinux && !isWSL) {
    environment.systemPackages = with pkgs; [
      deluge
      rpi-imager
    ];
  })

  (lib.optionalAttrs isWSL {
    winget.packages = [
      "DelugeTeam.Deluge"
      "RaspberryPiFoundation.RaspberryPiImager"
      "Romanitho.Winget-AutoUpdate"
      "Rufus.Rufus"
    ];
  })
]
