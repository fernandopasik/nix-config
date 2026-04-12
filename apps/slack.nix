{
  config,
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
      (lib.optionalAttrs isWSL { winget.packages = [ "SlackTechnologies.Slack" ]; })
    ]
  );
}
