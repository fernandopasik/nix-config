{ config, pkgs, ... }:

{
  imports = [
    ./grafana.nix
    ./minecraft.nix
    ./prometheus.nix
  ];
}
