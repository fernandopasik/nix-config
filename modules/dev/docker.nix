{
  config,
  isDarwin,
  isLinux,
  isWSL,
  lib,
  libx,
  pkgs,
  ...
}:
lib.mkMerge [
  (lib.optionalAttrs isDarwin { homebrew.casks = [ "docker" ]; })

  (lib.optionalAttrs isLinux {
    virtualisation.docker = {
      enable = true;
      rootless.enable = true;
      rootless.setSocketVariable = true;
    };
  })
]
