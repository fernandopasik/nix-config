{
  config,
  isDarwin,
  isWSL,
  lib,
  pkgs,
  ...
}:
let
  enabled = builtins.elem "nordvpn" config.apps;
in
{
  config = lib.mkIf enabled (
    lib.mkMerge [
      (lib.optionalAttrs isDarwin { homebrew.casks = [ "nordvpn" ]; })
      (lib.optionalAttrs isWSL { winget.packages = [ "NordSecurity.NordVPN" ]; })
    ]
  );
}
