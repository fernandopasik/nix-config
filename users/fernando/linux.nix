{
  pkgs,
  lib,
  config,
  ...
}:
{
  home-manager.users.fernando =
    { pkgs, config, ... }:
    {
      home.homeDirectory = "/home/fernando";
    };

  security.sudo.extraRules = [
    {
      users = [ "fernando" ];
      commands = [
        {
          command = "ALL";
          options = [
            "NOPASSWD"
            "SETENV"
          ];
        }
      ];
    }
  ];

  users.users.fernando = {
    shell = pkgs.zsh;
    home = "/home/fernando";
    isNormalUser = true;
    extraGroups = [
      "docker"
      "networkmanager"
      "wheel"
    ];
  };
}
