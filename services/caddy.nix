{ config, ... }:

{
  networking.firewall = {
    allowedTCPPorts = [
      80
      443
    ];
    enable = true;
  };

  services.caddy = {
    enable = true;
    virtualHosts = { };
  };
}
