{
  config,
  isDarwin,
  isWSL,
  lib,
  pkgs,
  ...
}:
lib.mkMerge [
  (lib.optionalAttrs isDarwin { homebrew.casks = [ "discord" ]; })

  (lib.optionalAttrs isWSL { winget.packages = [ "Discord.Discord" ]; })
]
