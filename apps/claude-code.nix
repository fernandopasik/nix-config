{
  config,
  lib,
  pkgs,
  ...
}:
let
  enabled = builtins.elem "claude-code" config.apps;
in
{
  config = lib.mkIf enabled { environment.systemPackages = with pkgs; [ claude-code ]; };
}
