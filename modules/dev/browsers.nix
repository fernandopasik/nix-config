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
      "librewolf"
      "microsoft-edge"
    ];
  })

  (lib.optionalAttrs isLinux {
    environment.systemPackages = with pkgs; [
      chromium
      librewolf
      google-chrome
      microsoft-edge
    ];
  })

  (lib.optionalAttrs isWSL {
    winget.packages = [
      "LibreWolf.LibreWolf"
      "Microsoft.Edge"
    ];
  })
]
