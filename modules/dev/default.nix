{ config, pkgs, ... }:

{
  imports = [
    ./languages
    ./nodejs
    ./python
    ./infrastructure
  ];
}
