{
  config,
  lib,
  isDarwin,
  isLinux,
  pkgs,
  ...
}:
{
  environment.systemPackages =
    with pkgs;
    [
      # monitoring and info
      htop
      neofetch
      pkg-config
      tree

      # networking
      curl
      iperf3
      rsync
      wget

      # encryption
      gnupg
      openssl

      # compression tools
      bzip2
      xz
      zlib
    ]
    ++ lib.optionals isLinux [ lsb-release ];
}
