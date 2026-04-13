{
  config,
  isDarwin,
  lib,
  pkgs,
  ...
}:
let
  enabled = builtins.elem "apple-notes" config.apps;
in
{
  config = lib.mkIf enabled (
    lib.mkMerge [
      (lib.optionalAttrs isDarwin {
        system.defaults.dock.persistent-apps = [ "/System/Applications/Notes.app" ];
      })
    ]
  );
}
