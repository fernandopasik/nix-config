{
  config,
  lib,
  pkgs,
  ...
}:

let
  geyserJar = pkgs.fetchurl {
    url = "https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/spigot";
    sha256 = lib.fakeSha256;
  };

  floodgateJar = pkgs.fetchurl {
    url = "https://download.geysermc.org/v2/projects/floodgate/versions/latest/builds/latest/downloads/spigot";
    sha256 = lib.fakeSha256;
  };

  viaVersionJar = pkgs.fetchurl {
    url = "https://github.com/ViaVersion/ViaVersion/releases/download/5.5.0/ViaVersion-5.5.0.jar";
    sha256 = lib.fakeSha256;
  };
in

{
  networking.firewall = {
    allowedTCPPorts = [ 25565 ];
    allowedUDPPorts = [ 19132 ];
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

  system.activationScripts.text = ''
    echo "Copying Minecraft plugins"
    mkdir -p ${config.services.minecraft-server.dataDir}/plugins
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
