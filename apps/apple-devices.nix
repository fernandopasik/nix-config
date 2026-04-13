{
  config,
  isWSL,
  lib,
  pkgs,
  ...
}:
let
  enabled = builtins.elem "apple-devices" config.apps;
in
{
  config = lib.mkIf enabled (
    lib.mkMerge [ (lib.optionalAttrs isWSL { winget.packages = [ "9NP83LWLPZ9K" ]; }) ]
  );
}
