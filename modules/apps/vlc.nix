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
  (lib.optionalAttrs isDarwin { homebrew.casks = [ "vlc" ]; })

  (lib.optionalAttrs (isLinux && !isWSL) { environment.systemPackages = with pkgs; [ vlc ]; })

  (lib.optionalAttrs isWSL { winget.packages = [ "VideoLAN.VLC" ]; })
]
