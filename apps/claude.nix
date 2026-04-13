{
  config,
  isDarwin,
  isWSL,
  lib,
  pkgs,
  ...
}:
let
  enabled = builtins.elem "claude" config.apps;
in
{
  config = lib.mkIf enabled (
    lib.mkMerge [
      (lib.optionalAttrs isDarwin {
        homebrew.casks = [ "claude" ];
        system.defaults.dock.persistent-apps = [ "/Applications/Claude.app" ];
      })
      (lib.optionalAttrs isWSL { winget.packages = [ "Anthropic.Claude" ]; })
    ]
  );
}
