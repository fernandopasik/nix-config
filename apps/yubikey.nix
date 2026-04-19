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
      {
        environment.systemPackages = with pkgs; [
          libfido2
          yubikey-manager
          yubikey-personalization
        ];

        programs.gnupg.agent = {
          enable = true;
          enableSSHSupport = true;
        };

        services.pcscd.enable = true;

        services.udev.packages = with pkgs; [
          yubikey-personalization
          libu2f-host
        ];
      }

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
