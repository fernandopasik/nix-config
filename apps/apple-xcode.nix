{
  config,
  isDarwin,
  isWSL,
  lib,
  pkgs,
  ...
}:
let
  enabled = builtins.elem "apple-xcode" config.apps;
in
{
  config = lib.mkIf enabled (
    lib.mkMerge [
      (lib.optionalAttrs isDarwin {
        homebrew.masApps = {
          Xcode = 497799835;
        };
      })
    ]
  );
}
