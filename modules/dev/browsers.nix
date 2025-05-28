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
      "firefox"
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
    system.activationScripts.postActivation.text = libx.installWingetPkgs [
      "Microsoft.Edge"
      "Mozilla.Firefox"
    ];
  })
]
