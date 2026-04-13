{
  config,
  isDarwin,
  lib,
  pkgs,
  ...
}:
let
  enabled = builtins.elem "gemini" config.apps;
in
{
  config = lib.mkIf enabled (
    lib.mkMerge [
      (lib.optionalAttrs isDarwin {
        homebrew.casks = [ "google-gemini" ];
        system.defaults.dock.persistent-apps = [ "/Applications/Gemini.app" ];
      })
    ]
  );
}
