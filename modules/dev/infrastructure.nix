{
  config,
  isWSL,
  pkgs,
  ...
}:

{
  environment.systemPackages =
    with pkgs;
    [
      # Docker
      dive
      hadolint

      # K8s
      kubectl
      kubernetes-helm
      minikube

      # Tools
      opentofu
      pulumi
      terraform
    ]
    ++ lib.optional (!isWSL) qemu;
}
