{
  config,
  isWSL,
  lib,
  pkgs,
  ...
}:
let
  enabled = builtins.elem "rufus" config.apps;
in
{
  config = lib.mkIf enabled (
    lib.mkMerge [ (lib.optionalAttrs isWSL { winget.packages = [ "Rufus.Rufus" ]; }) ]
  );
}
