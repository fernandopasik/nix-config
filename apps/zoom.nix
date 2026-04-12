{
  config,
  isDarwin,
  isHeadless,
  isWSL,
  lib,
  pkgs,
  ...
}:
let
  enabled = builtins.elem "zoom" config.apps;
in
{
  config = lib.mkIf enabled (
    lib.mkMerge [
      { environment.systemPackages = lib.optionals (!isHeadless) (with pkgs; [ zoom-us ]); }
      (lib.optionalAttrs isDarwin {
        system.activationScripts.postActivation.text = ''
          echo "🧹 Removing Zoom background services..."
          rm -f /Library/LaunchDaemons/us.zoom.*
          rm -f /Library/LaunchAgents/us.zoom.*
        '';
      })
      (lib.optionalAttrs isWSL { winget.packages = [ "Zoom.Zoom" ]; })
    ]
  );
}
