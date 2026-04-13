{ config, lib, ... }:
{
  options.apps = lib.mkOption {
    type = lib.types.listOf (lib.types.oneOf [ lib.types.str ]);
    default = [ ];
    description = "List of Apps to be installed in the System.";
  };

  imports = [
    ./apple-facetime.nix
    ./apple-messages.nix
    ./chatgpt.nix
    ./claude.nix
    ./discord.nix
    ./gemini.nix
    ./google-chrome.nix
    ./google-drive.nix
    ./notion.nix
    ./slack.nix
    ./signal.nix
    ./spotify.nix
    ./teams.nix
    ./vlc.nix
    ./whatsapp.nix
    ./zoom.nix
  ];
}
