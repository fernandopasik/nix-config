{ config, pkgs, ... }:

{
  boot.kernelModules = [ "vhci-hcd" ];
  environment.systemPackages = with pkgs; [ kmod ];

  wsl.enable = true;
  wsl.defaultUser = "fernando";

  winget.packages = [ "dorssel.usbipd-win" ];
}
