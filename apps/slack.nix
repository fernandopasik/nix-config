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
  enabled = builtins.elem "slack" config.apps;
in
{
  config = lib.mkIf enabled (
    lib.mkMerge [
      { environment.systemPackages = lib.optionals (!isHeadless) (with pkgs; [ slack ]); }
      (lib.optionalAttrs isDarwin {
        system.defaults.dock.persistent-apps = [ "/Applications/Nix Apps/Slack.app" ];
      })
      (lib.optionalAttrs isWSL { winget.packages = [ "SlackTechnologies.Slack" ]; })
    ]
  );
}
