{ config, lib, ... }:
{
  options.apps = lib.mkOption {
    type = lib.types.listOf (lib.types.oneOf [ lib.types.str ]);
    default = [ ];
    description = "List of Apps to be installed in the System.";
  };

  imports = [
    ./apple-devices.nix
    ./apple-facetime.nix
    ./apple-icloud.nix
    ./apple-messages.nix
    ./apple-notes.nix
    ./chatgpt.nix
    ./chromium.nix
    ./claude.nix
    ./discord.nix
    ./firefox.nix
    ./freetube.nix
    ./gemini.nix
    ./google-chrome.nix
    ./google-drive.nix
    ./librewolf.nix
    ./microsoft-edge.nix
    ./notion.nix
    ./signal.nix
    ./slack.nix
    ./spotify.nix
    ./teams.nix
    ./vlc.nix
    ./whatsapp.nix
    ./wireshark.nix
    ./yubikey.nix
    ./zoom.nix
  ];
}
