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
  (lib.optionalAttrs isDarwin { homebrew.casks = [ "microsoft-edge" ]; })

  (lib.optionalAttrs isLinux {
    environment.systemPackages = with pkgs; [
      chromium
      microsoft-edge
    ];
  })

  (lib.optionalAttrs isWSL { winget.packages = [ "Microsoft.Edge" ]; })
]
