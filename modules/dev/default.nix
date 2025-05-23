{ config, pkgs, ... }:

{
  imports = [
    ./git
    ./github
    ./languages
    ./nodejs
    ./python
    ./docker
    ./infrastructure
    ./browsers
    ./tools
  ];
}
