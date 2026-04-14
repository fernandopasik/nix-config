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
  (lib.optionalAttrs isDarwin { homebrew.casks = [ "deluge" ]; })

  (lib.optionalAttrs (isLinux && !isWSL) { environment.systemPackages = with pkgs; [ deluge ]; })

  (lib.optionalAttrs isWSL {
    winget.packages = [
      "DelugeTeam.Deluge"
      "Romanitho.Winget-AutoUpdate"
      "Rufus.Rufus"
    ];
  })
]
