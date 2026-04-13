{
  config,
  isDarwin,
  isWSL,
  lib,
  pkgs,
  ...
}:
let
  enabled = builtins.elem "whatsapp" config.apps;
in
{
  config = lib.mkIf enabled (
    lib.mkMerge [
      (lib.optionalAttrs isDarwin {
        environment.systemPackages = with pkgs; [ whatsapp-for-mac ];
        system.defaults.dock.persistent-apps = [ "/Applications/Nix Apps/Whatsapp.app" ];
      })
      (lib.optionalAttrs isWSL { winget.packages = [ "9NKSQGP7F2NH" ]; })
    ]
  );
}
