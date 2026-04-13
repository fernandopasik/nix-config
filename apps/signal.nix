{
  config,
  isHeadless,
  isWSL,
  lib,
  pkgs,
  ...
}:
let
  enabled = builtins.elem "signal" config.apps;
in
{
  config = lib.mkIf enabled (
    lib.mkMerge [
      { environment.systemPackages = lib.optionals (!isHeadless) (with pkgs; [ signal-desktop ]); }
      (lib.optionalAttrs isWSL { winget.packages = [ "OpenWhisperSystems.Signal" ]; })
    ]
  );
}
