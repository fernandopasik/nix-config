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
  enabled = builtins.elem "vscode" config.apps;
in
{
  config = lib.mkIf enabled (
    lib.mkMerge [
      (lib.optionalAttrs isDarwin {
        system.defaults.dock.persistent-apps = [ "/Applications/Nix Apps/Visual Studio Code.app" ];
      })
      (lib.optionalAttrs (!isHeadless) { environment.systemPackages = with pkgs; [ vscode ]; })
      (lib.optionalAttrs isWSL { winget.packages = [ "Microsoft.VisualStudioCode" ]; })
    ]
  );
}
