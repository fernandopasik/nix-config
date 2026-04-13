{
  config,
  isHeadless,
  isWSL,
  lib,
  pkgs,
  ...
}:
let
  enabled = builtins.elem "freetube" config.apps;
in
{
  config = lib.mkIf enabled (
    lib.mkMerge [
      { environment.systemPackages = lib.optionals (!isHeadless) (with pkgs; [ freetube ]); }
      (lib.optionalAttrs isWSL { winget.packages = [ "FreeTube.FreeTube" ]; })
    ]
  );
}
