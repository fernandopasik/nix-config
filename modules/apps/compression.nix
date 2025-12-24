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
  (lib.optionalAttrs isDarwin { homebrew.casks = [ "the-unarchiver" ]; })

  (lib.optionalAttrs isWSL { winget.packages = [ "7zip.7zip" ]; })
]
