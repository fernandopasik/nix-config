{
  config,
  isWSL,
  lib,
  pkgs,
  ...
}:
let
  enabled = builtins.elem "7zip" config.apps;
in
{
  config = lib.mkIf enabled (
    lib.mkMerge [ (lib.optionalAttrs isWSL { winget.packages = [ "7zip.7zip" ]; }) ]
  );
}
