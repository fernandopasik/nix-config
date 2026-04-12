{
  config,
  isDarwin,
  lib,
  pkgs,
  ...
}:

{
  imports = lib.optionals isDarwin [ ./apple.nix ] ++ [
    ./signal.nix
    ./whatsapp.nix
  ];
}
