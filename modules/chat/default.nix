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
    ./teams.nix
    ./whatsapp.nix
    ./zoom.nix
  ];
}
