{
  config,
  isHeadless,
  isWSL,
  lib,
  pkgs,
  ...
}:
let
  enabled = builtins.elem "discord" config.apps;
in
{
  config = lib.mkIf enabled (
    lib.mkMerge [
      { environment.systemPackages = lib.optionals (!isHeadless) (with pkgs; [ discord ]); }
      (lib.optionalAttrs isWSL { winget.packages = [ "Discord.Discord" ]; })
    ]
  );
}
