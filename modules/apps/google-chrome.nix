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
  (lib.optionalAttrs isDarwin { homebrew.casks = [ "google-chrome" ]; })

  (lib.optionalAttrs isLinux { environment.systemPackages = with pkgs; [ google-chrome ]; })

  (lib.optionalAttrs isWSL { winget.packages = [ "Google.Chrome" ]; })
]
