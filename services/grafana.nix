{ config, ... }:

{
  networking.firewall = {
    allowedTCPPorts = [ 3000 ];
    enable = true;
  };

  services.grafana = {
    enable = true;

    provision = {
      enable = true;

      datasources.settings = {
        apiVersion = 1;
        datasources = [
          {
            name = "Prometheus";
            type = "prometheus";
            url = "http://127.0.0.1:9090";
            orgId = 1;
          }
        ];
        deleteDatasources = [
          {
            name = "Prometheus";
            orgId = 1;
          }
        ];
      };
    };

    settings = {
      analytics = {
        check_for_plugin_updates = true;
        check_for_updates = true;
        feedback_links_enabled = false;
        reporting_enabled = false;
      };

      server = {
        enable_gzip = true;
        http_port = 3000;
      };
    };
  };
}
