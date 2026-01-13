{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Runtimes
    nodejs_24
    bun
    deno

    # Package Managers
    corepack_24
    volta
  ];

  programs.zsh.promptInit = ''
    export NPM_CONFIG_PREFIX="/var/lib/npm"
    export PATH="$NPM_CONFIG_PREFIX/bin:$PATH"

    export VOLTA_HOME="$HOME/.volta";
    export PATH="$VOLTA_HOME/bin:$PATH"
  '';

  system.activationScripts.npm-global-install = {
    deps = [ "users" ];
    text = ''
      if [ "$NIXOS_ACTION" = "switch" ]; then
        set -euo pipefail

        NPM_CONFIG_PREFIX=/var/lib/npm
        mkdir -p "$NPM_CONFIG_PREFIX"
        chown root:wheel "$NPM_CONFIG_PREFIX"
        chmod 775 "$NPM_CONFIG_PREFIX"

        echo "📦 Installing npm global packages"
        ${pkgs.nodejs_24}/bin/npm i -g --prefix "$NPM_CONFIG_PREFIX" npm npm-check-updates
      fi
    '';
  };
}
