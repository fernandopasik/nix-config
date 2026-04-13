{
  config,
  isDarwin,
  isHeadless,
  isLinux,
  isWSL,
  lib,
  pkgs,
  ...
}:
let
  enabled = builtins.elem "microsoft-edge" config.apps;
in
{
  config = lib.mkIf enabled (
    lib.mkMerge [
      (lib.optionalAttrs isDarwin { homebrew.casks = [ "microsoft-edge" ]; })
      (lib.optionalAttrs (isLinux && !isHeadless) {
        environment.systemPackages = with pkgs; [ microsoft-edge ];
      })
      (lib.optionalAttrs isWSL { winget.packages = [ "Microsoft.Edge" ]; })
    ]
  );
}
