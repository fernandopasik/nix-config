{
  config,
  isHeadless,
  isWSL,
  lib,
  pkgs,
  ...
}:
let
  enabled = builtins.elem "librewolf" config.apps;
in
{
  config = lib.mkIf enabled (
    lib.mkMerge [
      { environment.systemPackages = with pkgs; [ librewolf ]; }
      (lib.optionalAttrs isWSL { winget.packages = [ "LibreWolf.LibreWolf" ]; })
    ]
  );
}
