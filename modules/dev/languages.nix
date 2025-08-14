{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Other Programming languages
    rustc
    haskellPackages.cabal-install
  ];
}
