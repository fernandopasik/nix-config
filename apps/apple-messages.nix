{
  config,
  isDarwin,
  lib,
  pkgs,
  ...
}:
let
  enabled = builtins.elem "apple-messages" config.apps;
in
{
  config = lib.mkIf enabled (
    lib.mkMerge [
      (lib.optionalAttrs isDarwin {
        system.defaults.dock.persistent-apps = [ "/System/Applications/Messages.app" ];
      })
    ]
  );
}
