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
    nixfmt-rfc-style
    statix
  ];

  nix = {
    gc = lib.mkMerge [
      {
        automatic = true;
        options = "--delete-older-than 1w";
        persistent = true;
        randomizedDelaySec = "30sec";
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

  system.stateVersion = if isDarwin then 6 else "25.05";
}
