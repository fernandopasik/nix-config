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
  (lib.optionalAttrs isDarwin { homebrew.casks = [ "spotify" ]; })

  (lib.optionalAttrs isWSL { winget.packages = [ "Spotify.Spotify" ]; })
]
