{
  config,
  isWSL,
  pkgs,
  lib,
  ...
}:
lib.mkMerge [
  { environment.systemPackages = with pkgs; [ google-chrome ]; }
  (lib.optionalAttrs isWSL { winget.packages = [ "Google.Chrome" ]; })
]
