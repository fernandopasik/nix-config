{
  config,
  isDarwin,
  isLinux,
  isWSL,
  pkgs,
  lib,
  ...
}:
lib.mkMerge [
  (lib.optionalAttrs isDarwin { homebrew.casks = [ "google-drive" ]; })

  (lib.optionalAttrs isWSL { winget.packages = [ "Google.GoogleDrive" ]; })
]
