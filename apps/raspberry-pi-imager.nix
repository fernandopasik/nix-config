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
  enabled = builtins.elem "raspberry-pi-imager" config.apps;
in
{
  config = lib.mkIf enabled (
    lib.mkMerge [
      (lib.optionalAttrs isDarwin { homebrew.casks = [ "raspberry-pi-imager" ]; })
      (lib.optionalAttrs (isLinux && !isHeadless) {
        environment.systemPackages = with pkgs; [ rpi-imager ];
      })
      (lib.optionalAttrs isWSL { winget.packages = [ "RaspberryPiFoundation.RaspberryPiImager" ]; })
    ]
  );
}
