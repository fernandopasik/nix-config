{
  config,
  isHeadless,
  isWSL,
  lib,
  pkgs,
  ...
}:
let
  enabled = builtins.elem "firefox" config.apps;
in
{
  config = lib.mkIf enabled (
    lib.mkMerge [
      { environment.systemPackages = with pkgs; [ firefox ]; }
      (lib.optionalAttrs isWSL { winget.packages = [ "Mozilla.Firefox" ]; })
    ]
  );
}
