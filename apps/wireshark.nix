{
  config,
  isHeadless,
  isWSL,
  lib,
  pkgs,
  ...
}:
let
  enabled = builtins.elem "wireshark" config.apps;
in
{
  config = lib.mkIf enabled (
    lib.mkMerge [
      { environment.systemPackages = lib.optionals (!isHeadless) (with pkgs; [ wireshark ]); }
      (lib.optionalAttrs isWSL { winget.packages = [ "WiresharkFoundation.Wireshark" ]; })
    ]
  );
}
