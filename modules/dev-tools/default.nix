{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # git and github
    git
    git-lfs
    gh
    act

    # Programming languages
    go
    ruby
    rustc
    jdk

    # Infrastructure
    dive
    hadolint
    kubectl
    kubernetes-helm
    minikube
    qemu
  ];

  nixpkgs.config.allowUnfreePredicate =
    pkg: builtins.elem (builtins.parseDrvName pkg.name).name [ "terraform" ];
}
