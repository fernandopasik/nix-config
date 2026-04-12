{
  config,
  isDarwin,
  isHeadless,
  isLinux,
  isWSL,
  lib,
  pkgs,
  ...
}:
let
  enabled = builtins.elem "notion" config.apps;
in
{
  config = lib.mkIf enabled (
    lib.mkMerge [
      {
        environment.systemPackages =
          with pkgs;
          if isLinux && !isHeadless then
            [ notion ]
          else if isDarwin then
            [ notion-app ]
          else
            [ ];
      }
      (lib.optionalAttrs isDarwin {
        system.defaults.dock.persistent-apps = [ "/Applications/Nix Apps/Notion.app" ];
      })
      (lib.optionalAttrs isWSL { winget.packages = [ "Notion.Notion" ]; })
    ]
  );
}
