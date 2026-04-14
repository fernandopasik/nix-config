{
  config,
  isDarwin,
  isLinux,
  isWSL,
  pkgs,
  lib,
  ...
}:
lib.mkMerge [ (lib.optionalAttrs isWSL { winget.packages = [ "Romanitho.Winget-AutoUpdate" ]; }) ]
