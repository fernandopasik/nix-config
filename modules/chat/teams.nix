{
  config,
  isDarwin,
  isWSL,
  lib,
  pkgs,
  ...
}:
lib.mkMerge [
  (lib.optionalAttrs isDarwin { homebrew.casks = [ "microsoft-teams" ]; })

  (lib.optionalAttrs isWSL { winget.packages = [ "Microsoft.Teams" ]; })
]
