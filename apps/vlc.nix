{
  config,
  isDarwin,
  isHeadless,
  isLinux,
  isWSL,
  lib,
  pkgs,
  ...
}:
let
  enabled = builtins.elem "vlc" config.apps;
in
{
  config = lib.mkIf enabled (
    lib.mkMerge [
      (lib.optionalAttrs isDarwin { homebrew.casks = [ "vlc" ]; })
      (lib.optionalAttrs (isLinux && !isHeadless) { environment.systemPackages = with pkgs; [ vlc ]; })
      (lib.optionalAttrs isWSL { winget.packages = [ "VideoLAN.VLC" ]; })
    ]
  );
}
