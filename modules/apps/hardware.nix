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
      "stats"
      "tg-pro"
    ];
  })

  (lib.optionalAttrs isWSL {
    system.activationScripts.postActivation.text = libx.installWingetPkgs [
      "CPUID.CPU-Z"
      "Rem0o.FanControl"
    ];
  })
]
