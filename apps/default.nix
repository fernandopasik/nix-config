{ config, lib, ... }:
{
  options.apps = lib.mkOption {
    type = lib.types.listOf (lib.types.oneOf [ lib.types.str ]);
    default = [ ];
    description = "List of Apps to be installed in the System.";
  };

  imports = [
    ./discord.nix
    ./google-drive.nix
    ./notion.nix
    ./slack.nix
    ./spotify.nix
  ];
}
