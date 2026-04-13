{
  config,
  isDarwin,
  isHeadless,
  isLinux,
  isWSL,
  lib,
  pkgs,
  ...
}:
let
  enabled = builtins.elem "yubikey" config.apps;
in
{
  config = lib.mkIf enabled (
    lib.mkMerge [
      { environment.systemPackages = with pkgs; [ yubikey-manager ]; }
      (lib.optionalAttrs isDarwin { homebrew.casks = [ "yubico-authenticator" ]; })
      (lib.optionalAttrs (isLinux && !isHeadless) {
        environment.systemPackages = with pkgs; [ yubioath-flutter ];
      })
      (lib.optionalAttrs isWSL {
        winget.packages = [
          "Yubico.Authenticator"
          "Yubico.YubiKeyManagerCLI"
        ];
      })
    ]
  );
}
