{
  config,
  isDarwin,
  isWSL,
  lib,
  pkgs,
  ...
}:
lib.mkMerge [
  (lib.optionalAttrs isDarwin {
    homebrew.casks = [ "zoom" ];

    system.activationScripts.postActivation.text = ''
      echo "🧹 Removing Zoom background services..."
      rm -f /Library/LaunchDaemons/us.zoom.*
      rm -f /Library/LaunchAgents/us.zoom.*
    '';
  })

  (lib.optionalAttrs isWSL { winget.packages = [ "Zoom.Zoom" ]; })
]
