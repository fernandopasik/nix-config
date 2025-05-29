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
      "google-chrome"
      "google-drive"
    ];
  })

  (lib.optionalAttrs isLinux {
    nixpkgs.config.allowUnfreePredicate =
      pkg: builtins.elem (pkg.pname or (pkg.meta.name or "")) [ "google-chrome" ];
  })

  (lib.optionalAttrs isWSL {
    system.activationScripts.postActivation.text = libx.installWingetPkgs [
      "Google.Chrome"
      "Google.GoogleDrive"
    ];
  })
]
