{
  config,
  isDarwin,
  isWSL,
  lib,
  pkgs,
  ...
}:
let
  enabled = builtins.elem "google-chrome" config.apps;
in
{
  config = lib.mkIf enabled (
    lib.mkMerge [
      { environment.systemPackages = with pkgs; [ google-chrome ]; }
      (lib.optionalAttrs isDarwin {
        system.defaults.dock.persistent-apps = [ "/Applications/Nix Apps/Google Chrome.app" ];
      })
      (lib.optionalAttrs isWSL { winget.packages = [ "Google.Chrome" ]; })
    ]
  );
}
