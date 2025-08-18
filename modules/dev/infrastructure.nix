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

    # Tools
    opentofu
    pulumi
  ];

  nixpkgs.config.allowUnfreePredicate =
    pkg: builtins.elem (pkg.pname or (pkg.meta.name or "")) [ "terraform" ];
}
