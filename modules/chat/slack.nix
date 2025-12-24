{
  config,
  isDarwin,
  isWSL,
  lib,
  pkgs,
  ...
}:
lib.mkMerge [
  (lib.optionalAttrs isDarwin { homebrew.casks = [ "slack" ]; })

  (lib.optionalAttrs isWSL { winget.packages = [ "SlackTechnologies.Slack" ]; })
]
