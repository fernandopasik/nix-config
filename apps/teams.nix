{
  config,
  isDarwin,
  isWSL,
  lib,
  pkgs,
  ...
}:
let
  enabled = builtins.elem "teams" config.apps;
in
{
  config = lib.mkIf enabled (
    lib.mkMerge [
      (lib.optionalAttrs isDarwin { environment.systemPackages = with pkgs; [ teams ]; })
      (lib.optionalAttrs isWSL { winget.packages = [ "Microsoft.Teams" ]; })
    ]
  );
}
