{
  config,
  isLinux,
  isWSL,
  lib,
  pkgs,
  ...
}:
let
  enabled = builtins.elem "chromium" config.apps;
in
{
  config = lib.mkIf enabled (
    lib.mkMerge [
      (lib.optionalAttrs isLinux { environment.systemPackages = with pkgs; [ chromium ]; })
      (lib.optionalAttrs isWSL { winget.packages = [ "Hibbiki.Chromium" ]; })
    ]
  );
}
