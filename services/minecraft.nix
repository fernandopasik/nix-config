{ config, pkgs, ... }:

{
  networking.firewall = {
    allowedTCPPorts = [ 25565 ];
    enable = true;
  };

  nixpkgs.config.allowUnfreePredicate =
    pkg: builtins.elem (pkg.pname or (pkg.meta.name or "")) [ "minecraft-server" ];

  services = {
    minecraft-server = {
      dataDir = "/var/lib/minecraft";
      declarative = true;
      enable = true;
      eula = true;
      openFirewall = true;
      package = pkgs.papermc;
      serverProperties = {
        level-name = "Fernando's World";
        max-players = 5;
        motd = "Fernando's Server";
        online-mode = true;
        server-port = 25565;
      };
    };
  };

  systemd.services = {
    minecraft-server.serviceConfig.Restart = "always";
  };
}
