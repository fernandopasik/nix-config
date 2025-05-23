{
  config,
  lib,
  isDarwin,
  isLinux,
  pkgs,
  ...
}:
{

  environment.systemPackages = with pkgs; [
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
  ];

  nix = {
    gc = lib.mkMerge [
      {
        automatic = true;
        options = "--delete-older-than 5";
      }
      (lib.optionalAttrs isDarwin {
        interval = {
          Weekday = 0;
        };
      })
      (lib.optionalAttrs isLinux { dates = "weekly"; })
    ];

    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
}
