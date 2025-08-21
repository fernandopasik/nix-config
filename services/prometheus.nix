{ config, ... }:

{
  services.prometheus = {
    enable = true;

    exporters = {
      node = {
        enable = true;

        enabledCollectors = [
          "cpu"
          "memory"
          "disk"
        ];
      };
    };

    globalConfig = {
      evaluation_interval = "15s";
      scrape_interval = "15s";
      scrape_timeout = "10s";
    };

    port = 9090;
  };
}
