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
    environment.systemPackages = with pkgs; [ firefox ];

    nixpkgs.config.allowUnfreePredicate =
      pkg:
      builtins.elem (pkg.pname or (pkg.meta.name or "")) [
        "google-chrome"
        "microsoft-edge"
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
