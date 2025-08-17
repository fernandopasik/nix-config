{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Runtimes
    python313

    # Runtime Managers
    pyenv
    pipenv
    pipx

    # Package Managers
    python313Packages.pip

    # Packages
    python313Packages.setuptools
    python313Packages.virtualenv

    # Required Libs
    gcc
    jq
    libffi
    libusb1
    gnumake
    readline
    sqlite
    tk
    yq
  ];

  environment = {
    shellInit = ''
      export LD_LIBRARY_PATH=${pkgs.gcc.cc.lib}/lib
    '';

    variables.PKG_CONFIG_PATH = pkgs.lib.makeSearchPath "lib/pkgconfig" [
      pkgs.bzip2.dev
      pkgs.libffi.dev
      pkgs.libusb1.dev
      pkgs.openssl.dev
      pkgs.readline.dev
      pkgs.sqlite.dev
      pkgs.zlib.dev
    ];
  };

  programs.zsh.promptInit = ''
    export PATH="$HOME/.local/bin:$PATH"

    [ -x "$(command -v poetry)" ] || pipx install poetry
    [ -x "$(command -v pipupgrade)" ] || pipx install pipupgrade
  '';
}
