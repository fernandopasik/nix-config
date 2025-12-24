{ config, lib, ... }:
let
  names = builtins.map (pkg: if builtins.isString pkg then pkg else pkg.name) config.winget.packages;
  installs = lib.concatStringsSep "\n" (
    map (
      pkg:
      let
        isStr = builtins.isString pkg;
        name = if isStr then pkg else pkg.name;
        locationArg =
          if !isStr && builtins.hasAttr "location" pkg && pkg.location != null then
            " --location='${pkg.location}'"
          else
            "";
        winget = "winget install --accept-package-agreements --silent --disable-interactivity --exact";
      in
      ''
        echo "🖥️ Installing ${name}"
        output=$(/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -NoProfile -Command "& {
          \$cmd_output = ${winget} --id='${name}'${locationArg} 2>&1;
          \$code = [int]\$LASTEXITCODE -band 0xFF;
          if (\$cmd_output -match 'The package cannot be upgraded using winget' -or \$code -eq 43) {
            \$cmd_output.ForEach({ \$_.Trim() }) | Where-Object { \$_ -notin @(\"\", \"-\", \"\\\", \"|\", \"/\") } | Out-String | Write-Host
            exit 0
          } else {
            exit \$LASTEXITCODE
          }
        }")
        status=$?
        echo "$output" | grep -v 'tcgetpgrp failed'
        if [ $status -ne 0 ]; then
          echo "PowerShell exit status: $status"
        fi
      ''
    ) config.winget.packages
  );
in
{
  options.winget.packages = lib.mkOption {
    type = lib.types.listOf (
      lib.types.oneOf [
        lib.types.str
        (lib.types.submodule {
          options = {
            name = lib.mkOption { type = lib.types.str; };
            location = lib.mkOption {
              type = lib.types.nullOr lib.types.str;
              default = null;
            };
          };
        })
      ]
    );
    default = [ ];
    description = "List of Winget packages to install via systemd oneshot. Each item can be a string (package ID) or an attrset with name and optional location.";
  };

  config.systemd.services.winget-install = lib.mkIf (config.winget.packages != [ ]) {
    description = "Install winget packages for Windows";
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
      echo "🖥️ Installing Winget packages"

      ${installs}
    '';
  };

  config.system.activationScripts.winget = {
    deps = [ "users" ];
    text = ''
      if [ "$NIXOS_ACTION" = "switch" ]; then
        echo "🖥️ Run Winget Install Service"
        /run/current-system/sw/bin/systemctl start winget-install.service
      fi
    '';
  };
}
