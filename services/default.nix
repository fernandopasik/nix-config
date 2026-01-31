{ config, pkgs, ... }:

{
  imports = [
    ./acme.nix
    ./grafana.nix
    ./minecraft.nix
    ./prometheus.nix
  ];
}
