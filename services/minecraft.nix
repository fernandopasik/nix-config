{ config, pkgs, ... }:

let
  geyserJar = pkgs.fetchurl {
    url = "https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/spigot";
    sha256 = "0y5ngrniy50bwwwf9s80p73h91xcf9qqydqd2q1anbvkrcn0p43b";
  };

  floodgateJar = pkgs.fetchurl {
    url = "https://download.geysermc.org/v2/projects/floodgate/versions/latest/builds/latest/downloads/spigot";
    sha256 = "0rr16cik5hiwhypcz8w6jylckn82b3j74ak1w22q66a3m7ki70gz";
  };

  viaVersionJar = pkgs.fetchurl {
    url = "https://github.com/ViaVersion/ViaVersion/releases/download/5.8.1/ViaVersion-5.8.1.jar";
    sha256 = "19d4k87kmrc5nw7qnsvmgpkrirp75rljfqwn31dyxi2471d3v6vv";
  };
in

{
  networking.firewall = {
    allowedTCPPorts = [ 25565 ];
    allowedUDPPorts = [ 19132 ];
    enable = true;
  };

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

  system.activationScripts.text = ''
    echo "Copying Minecraft plugins"
    mkdir -p ${config.services.minecraft-server.dataDir}/plugins
    rm -rf ${config.services.minecraft-server.dataDir}/plugins/*
    cp ${geyserJar} ${config.services.minecraft-server.dataDir}/plugins/Geyser-Spigot.jar
    cp ${floodgateJar} ${config.services.minecraft-server.dataDir}/plugins/Floodgate-Spigot.jar
    cp ${viaVersionJar} ${config.services.minecraft-server.dataDir}/plugins/ViaVersion.jar
    chown minecraft:minecraft ${config.services.minecraft-server.dataDir}/plugins/*.jar
    chmod 644 ${config.services.minecraft-server.dataDir}/plugins/*.jar
  '';

  systemd.services = {
    minecraft-server.serviceConfig.Restart = "always";
  };
}
