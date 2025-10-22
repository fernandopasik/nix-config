{
  config,
  isDarwin,
  isLinux,
  isWSL,
  pkgs,
  lib,
  libx,
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
    system.activationScripts.postActivation.text = libx.installWingetPkgs [
      "AgileBits.1Password"
      "NordSecurity.NordVPN"
    ];
  })
]
