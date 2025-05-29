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
  (lib.optionalAttrs isDarwin { homebrew.casks = [ "the-unarchiver" ]; })

  (lib.optionalAttrs isWSL {
    system.activationScripts.postActivation.text = libx.installWingetPkgs [ "7zip.7zip" ];
  })
]
