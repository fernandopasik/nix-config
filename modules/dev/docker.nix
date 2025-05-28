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

  (lib.optionalAttrs isWSL {
    system.activationScripts.postActivation.text = libx.installWingetPkgs [ "Docker.DockerDesktop" ];
  })
]
