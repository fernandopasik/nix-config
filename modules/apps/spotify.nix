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

  (lib.optionalAttrs (isLinux && !isWSL) { environment.systemPackages = with pkgs; [ spotify ]; })

  (lib.optionalAttrs isWSL { winget.packages = [ "Spotify.Spotify" ]; })
]
