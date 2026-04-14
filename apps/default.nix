{ config, lib, ... }:
{
  options.apps = lib.mkOption {
    type = lib.types.listOf (lib.types.oneOf [ lib.types.str ]);
    default = [ ];
    description = "List of Apps to be installed in the System.";
  };

  imports = [
    ./1password.nix
    ./7zip.nix
    ./apple-devices.nix
    ./apple-facetime.nix
    ./apple-icloud.nix
    ./apple-messages.nix
    ./apple-notes.nix
    ./apple-xcode.nix
    ./chatgpt.nix
    ./chromium.nix
    ./claude.nix
    ./deluge.nix
    ./discord.nix
    ./firefox.nix
    ./freetube.nix
    ./gemini.nix
    ./ghostty.nix
    ./google-chrome.nix
    ./google-drive.nix
    ./librewolf.nix
    ./microsoft-edge.nix
    ./nordvpn.nix
    ./notion.nix
    ./raspberry-pi-imager.nix
    ./rufus.nix
    ./signal.nix
    ./slack.nix
    ./spotify.nix
    ./teams.nix
    ./vlc.nix
    ./vscode.nix
    ./whatsapp.nix
    ./wireshark.nix
    ./yubikey.nix
    ./zoom.nix
  ];
}
