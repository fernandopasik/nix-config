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
      pkgs.openssl.dev
      pkgs.readline.dev
      pkgs.sqlite.dev
      pkgs.zlib.dev
    ];
  };

  programs.zsh.promptInit = ''
    pipx ensurepath
  '';

  system.activationScripts.postActivation.text = ''
    echo "🐍 Setup Python global packages"
    PIPX_CMD=${pkgs.pipx}/bin/pipx

    $PIPX_CMD install -f poetry
    $PIPX_CMD install -f pipupgrade
  '';
}
