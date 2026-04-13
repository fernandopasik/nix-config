{
  config,
  isWSL,
  lib,
  pkgs,
  ...
}:
let
  enabled = builtins.elem "apple-icloud" config.apps;
in
{
  config = lib.mkIf enabled (
    lib.mkMerge [ (lib.optionalAttrs isWSL { winget.packages = [ "9PKTQ5699M62" ]; }) ]
  );
}
