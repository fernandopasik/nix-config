{
  config,
  isDarwin,
  isWSL,
  lib,
  pkgs,
  ...
}:
lib.mkMerge [
  (lib.optionalAttrs isDarwin { homebrew.casks = [ "signal" ]; })

  (lib.optionalAttrs isWSL { winget.packages = [ "OpenWhisperSystems.Signal" ]; })
]
