{ config, pkgs, ... }:

{
  imports = [
    ./acme.nix
    ./caddy.nix
    ./grafana.nix
    ./minecraft.nix
    ./prometheus.nix
    ./searx.nix
  ];
}
