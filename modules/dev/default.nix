{ config, pkgs, ... }:

{
  imports = [
    ./nodejs
    ./python
    ./infrastructure
  ];
}
