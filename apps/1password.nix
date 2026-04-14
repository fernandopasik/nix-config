{
  config,
  isHeadless,
  isWSL,
  lib,
  pkgs,
  ...
}:
let
  enabled = builtins.elem "1password" config.apps;
in
{
  config = lib.mkIf enabled (
    lib.mkMerge [
      {
        environment.systemPackages =
          with pkgs;
          [ _1password-cli ] ++ lib.optionals (!isHeadless) [ _1password-gui ];
      }
      (lib.optionalAttrs isWSL { winget.packages = [ "AgileBits.1Password" ]; })
    ]
  );
}
