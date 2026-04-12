{
  config,
  isHeadless,
  isWSL,
  lib,
  pkgs,
  ...
}:
let
  enabled = builtins.elem "spotify" config.apps;
in
{
  config = lib.mkIf enabled (
    lib.mkMerge [
      { environment.systemPackages = lib.optionals (!isHeadless) (with pkgs; [ spotify ]); }
      (lib.optionalAttrs isWSL { winget.packages = [ "Spotify.Spotify" ]; })
    ]
  );
}
