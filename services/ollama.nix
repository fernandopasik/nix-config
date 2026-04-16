{
  config,
  isDarwin,
  lib,
  pkgs,
  ...
}:

{
  services.ollama = {
    enable = true;
    acceleration = lib.mkIf (!isDarwin) "cuda";
  };
}
