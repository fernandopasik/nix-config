{
  config,
  isDarwin,
  isLinux,
  isHeadless,
  lib,
  pkgs,
  ...
}:
let
  enabled = builtins.elem "ghostty" config.apps;
in
{
  config = lib.mkIf enabled (
    lib.mkMerge [
      (lib.optionalAttrs (isLinux && isHeadless) { environment.systemPackages = with pkgs; [ ghostty ]; })
      (lib.optionalAttrs isDarwin {
        environment.systemPackages = with pkgs; [ ghostty-bin ];
        system.defaults.dock.persistent-apps = [ "/Applications/Nix Apps/Ghostty.app" ];
      })
    ]
  );
}
