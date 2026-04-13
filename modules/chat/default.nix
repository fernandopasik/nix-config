{
  config,
  isDarwin,
  lib,
  pkgs,
  ...
}:

{
  imports = lib.optionals isDarwin [ ./apple.nix ];
}
