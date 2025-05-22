{ config, pkgs, ... }:

{
  imports = [
    ./git
    ./github
    ./languages
    ./nodejs
    ./python
    ./infrastructure
  ];
}
