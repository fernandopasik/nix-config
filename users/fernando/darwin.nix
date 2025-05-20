{
  pkgs,
  lib,
  config,
  ...
}:
{
  home-manager.users.fernando =
    {
      pkgs,
      lib,
      config,
      ...
    }:
    {
      home.activation.unhideLibrary = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        /usr/bin/chflags nohidden ~/Library
      '';

      home.homeDirectory = "/Users/fernando";
    };

  security.sudo.extraConfig = ''
    Defaults:fernando !requiretty
    fernando ALL=(ALL) NOPASSWD:SETENV: ALL
  '';

  system = {
    defaults.dock.persistent-apps = [
      "/Applications/Signal.app"
      "/System/Applications/Home.app"
      "/System/Applications/Notes.app"
      "/Applications/Visual Studio Code.app"
    ];

    defaults.dock.persistent-others = [ "/Users/fernando/Downloads" ];
  };

  users.users.fernando = {
    shell = pkgs.zsh;
    home = "/Users/fernando";
  };
}
