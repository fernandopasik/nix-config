{
  config,
  isDarwin,
  lib,
  pkgs,
  ...
}:

lib.mkMerge [
  (lib.optionalAttrs isDarwin { environment.systemPackages = lib.mkIf isDarwin [ pkgs.ollama ]; })

  (lib.optionalAttrs (!isDarwin) {
    services.ollama = {
      enable = true;
      acceleration = "cuda";
    };
  })
]
