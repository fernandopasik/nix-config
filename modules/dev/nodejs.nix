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
    export NPM_CONFIG_PREFIX="/var/lib/npm/node_packages/"
    export PATH="/var/lib/npm/node_packages/bin:$PATH"

    export VOLTA_HOME="$HOME/.volta";
    export PATH="$VOLTA_HOME/bin:$PATH"
  '';

  systemd.services.npm-global-install = {
    description = "Install global npm packages for wheel users";
    after = [ "network.target" ];
    wants = [ "network.target" ];
    serviceConfig = {
      Type = "oneshot";
      User = "root";
      Group = "wheel";
      RemainAfterExit = true;
      StandardOutput = "journal";
      StandardError = "journal";
      Environment = "PATH=/run/current-system/sw/bin:/run/wrappers/bin";
    };
    script = ''
      set -euo pipefail

      NPM_CONFIG_PREFIX=/var/lib/npm/node_packages
      mkdir -p "$NPM_CONFIG_PREFIX"
      chown root:wheel "$NPM_CONFIG_PREFIX"
      chmod 775 "$NPM_CONFIG_PREFIX"

      echo "📦 Installing npm global packages"
      ${pkgs.nodejs_24}/bin/npm install -g --prefix "$NPM_CONFIG_PREFIX" npm npm-check-updates
      ${pkgs.nodejs_24}/bin/npm install -g --prefix "$NPM_CONFIG_PREFIX" --loglevel=error yo
    '';
    wantedBy = [ "multi-user.target" ];
  };
}
