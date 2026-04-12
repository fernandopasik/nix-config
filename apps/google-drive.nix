{
  config,
  isDarwin,
  isWSL,
  lib,
  pkgs,
  ...
}:
let
  enabled = builtins.elem "google-drive" config.apps;
in
{
  config = lib.mkIf enabled (
    lib.mkMerge [
      (lib.optionalAttrs isDarwin { homebrew.casks = [ "google-drive" ]; })
      (lib.optionalAttrs isWSL { winget.packages = [ "Google.GoogleDrive" ]; })
    ]
  );
}
