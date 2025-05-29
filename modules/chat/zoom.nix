{
  config,
  isDarwin,
  isWSL,
  lib,
  libx,
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

  (lib.optionalAttrs isWSL {
    system.activationScripts.postActivation.text = libx.installWingetPkgs [ "Zoom.Zoom" ];
  })
]
