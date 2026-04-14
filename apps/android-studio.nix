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
  enabled = builtins.elem "android-studio" config.apps;
in
{
  config = lib.mkIf enabled (
    lib.mkMerge [
      (lib.optionalAttrs isDarwin { homebrew.casks = [ "android-studio" ]; })
      (lib.optionalAttrs (isLinux && !isHeadless) {
        environment.systemPackages = with pkgs; [ android-studio ];
      })
      (lib.optionalAttrs isWSL { winget.packages = [ "Google.AndroidStudio" ]; })
    ]
  );
}
