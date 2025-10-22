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
      "yubico-authenticator"
      "yubico-yubikey-manager"
    ];
  })

  (lib.optionalAttrs (isLinux || isWSL) {
    environment.systemPackages = with pkgs; [ yubikey-manager ];
  })

  (lib.optionalAttrs isWSL {
    system.activationScripts.postActivation.text = libx.installWingetPkgs [
      "AgileBits.1Password"
      "NordSecurity.NordVPN"
      "Yubico.Authenticator"
      "Yubico.YubiKeyManagerCLI"
    ];
  })
]
