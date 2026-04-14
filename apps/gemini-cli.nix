{
  config,
  lib,
  pkgs,
  ...
}:
let
  enabled = builtins.elem "gemini-cli" config.apps;
in
{
  config = lib.mkIf enabled { environment.systemPackages = with pkgs; [ gemini-cli ]; };
}
