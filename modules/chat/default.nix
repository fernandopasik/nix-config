{
  config,
  isDarwin,
  lib,
  pkgs,
  ...
}:

{
  imports = lib.optionals isDarwin [ ./apple.nix ] ++ [
    ./discord.nix
    ./signal.nix
    ./slack.nix
    ./teams.nix
    ./whatsapp.nix
    ./zoom.nix
  ];
}
