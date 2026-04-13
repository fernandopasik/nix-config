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
    ];
  })

  (lib.optionalAttrs isWSL {
    winget.packages = [
      "AgileBits.1Password"
      "NordSecurity.NordVPN"
    ];
  })
]
