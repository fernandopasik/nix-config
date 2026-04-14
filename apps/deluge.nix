{
  config,
  isHeadless,
  isWSL,
  lib,
  pkgs,
  ...
}:
let
  enabled = builtins.elem "deluge" config.apps;
in
{
  config = lib.mkIf enabled (
    lib.mkMerge [
      { environment.systemPackages = lib.optionals (!isHeadless) (with pkgs; [ deluge ]); }
      (lib.optionalAttrs isWSL { winget.packages = [ "DelugeTeam.Deluge" ]; })
    ]
  );
}
