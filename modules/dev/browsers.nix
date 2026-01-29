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
      "firefox"
      "librewolf"
      "microsoft-edge"
    ];
  })

  (lib.optionalAttrs isLinux {
    environment.systemPackages = with pkgs; [
      firefox
      google-chrome
      microsoft-edge
    ];
  })

  (lib.optionalAttrs isWSL {
    winget.packages = [
      "LibreWolf.LibreWolf"
      "Microsoft.Edge"
      "Mozilla.Firefox"
    ];
  })
]
