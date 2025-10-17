{ config, ... }:

{
  services.prometheus = {
    enable = true;

    exporters = {
      node = {
        enable = true;
      };
    };

    globalConfig = {
      evaluation_interval = "15s";
      scrape_interval = "15s";
      scrape_timeout = "10s";
    };

    port = 9090;

    scrapeConfigs = [
      {
        job_name = "node";
        static_configs = [ { targets = [ "localhost:9100" ]; } ];
      }
    ];
  };
}
