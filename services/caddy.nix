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
    virtualHosts."http://:80" = {
      extraConfig = ''
        respond "hello"
      '';
    };
    virtualHosts."https://:443" = {
      extraConfig = ''
        tls internal
        respond "hello"
      '';
    };
  };
}
