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
  (lib.optionalAttrs isDarwin { homebrew.casks = [ "google-chrome" ]; })

  (lib.optionalAttrs isLinux {
    nixpkgs.config.allowUnfreePredicate =
      pkg: builtins.elem (pkg.pname or (pkg.meta.name or "")) [ "google-chrome" ];
  })

  (lib.optionalAttrs isWSL { winget.packages = [ "Google.Chrome" ]; })
]
