{ config, ... }:

{
  security.acme = {
    acceptTerms = true;

    defaults = {
      dnsProvider = "cloudflare";
      dnsResolver = "1.1.1.1:53";
    };
  };
}
