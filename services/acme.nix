{ config, pkgs, ... }:

{
  security.acme = {
    acceptTerms = true;

    defaults = {
      dnsProvider = "cloudflare";
      dnsResolver = "1.1.1.1:53";
    };
  };

  environment.systemPackages = with pkgs; [ nssTools ];
}
