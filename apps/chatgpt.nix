{
  config,
  isDarwin,
  isWSL,
  lib,
  pkgs,
  ...
}:
let
  enabled = builtins.elem "chatgpt" config.apps;
in
{
  config = lib.mkIf enabled (
    lib.mkMerge [
      (lib.optionalAttrs isDarwin {
        environment.systemPackages = with pkgs; [ chatgpt ];
        system.defaults.dock.persistent-apps = [ "/Applications/Nix Apps/ChatGPT.app" ];
      })
      (lib.optionalAttrs isWSL { winget.packages = [ "9nt1r1c2hh7j" ]; })
    ]
  );
}
