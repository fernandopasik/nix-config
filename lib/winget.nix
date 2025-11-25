{ lib }:
{
  installWingetPkgs =
    pkgs:
    let
      installOne =
        pkg:
        let
          isStr = builtins.isString pkg;
          name = if isStr then pkg else pkg.name;
          locationArg = if (!isStr && pkg ? location) then " --location='" + pkg.location + "'" else "";
          winget = "winget install --accept-package-agreements --silent --disable-interactivity --exact";
        in
        ''
          OLD_SYSTEM=$(readlink -f /run/current-system 2>/dev/null || true)
          NEW_SYSTEM=$(readlink -f /nix/var/nix/profiles/system)

          if [ "$OLD_SYSTEM" == "$NEW_SYSTEM" ]; then
            exit 0
          fi

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
        '';
    in
    builtins.concatStringsSep "\n\n" (builtins.map installOne pkgs);
}
