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
  (lib.optionalAttrs isDarwin { homebrew.casks = [ "1password" ]; })

  (lib.optionalAttrs isWSL { winget.packages = [ "AgileBits.1Password" ]; })
]
