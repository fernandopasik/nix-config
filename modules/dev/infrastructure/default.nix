{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Docker
    dive
    hadolint

    # K8s
    kubectl
    kubernetes-helm
    minikube

    # VMs
    qemu
  ];

  nixpkgs.config.allowUnfreePredicate =
    pkg: builtins.elem (builtins.parseDrvName pkg.name).name [ "terraform" ];
}
