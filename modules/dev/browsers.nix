{
  config,
  isDarwin,
  isLinux,
  pkgs,
  lib,
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
]
