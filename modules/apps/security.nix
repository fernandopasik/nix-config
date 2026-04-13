{
  config,
  isDarwin,
  isLinux,
  isWSL,
  pkgs,
  lib,
  ...
}:
lib.mkMerge [
  (lib.optionalAttrs isDarwin {
    homebrew.casks = [
      "1password"
      "nordvpn"
      "wireshark-app"
    ];
  })

  (lib.optionalAttrs (isLinux || isWSL) { environment.systemPackages = with pkgs; [ wireshark ]; })

  (lib.optionalAttrs isWSL {
    winget.packages = [
      "AgileBits.1Password"
      "NordSecurity.NordVPN"
      "WiresharkFoundation.Wireshark"
    ];
  })
]
