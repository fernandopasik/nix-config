{
  config,
  isDarwin,
  isWSL,
  lib,
  pkgs,
  ...
}:
lib.mkMerge [
  (lib.optionalAttrs isDarwin { environment.systemPackages = with pkgs; [ teams ]; })
  (lib.optionalAttrs isWSL { winget.packages = [ "Microsoft.Teams" ]; })
]
