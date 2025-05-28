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
          locationArg = if (!isStr && pkg ? location) then " --location=\"${pkg.location}\"" else "";
          winget = "winget install --accept-package-agreements --silent --disable-interactivity --include-unknown --exact";
          script = ''
            & {
              ${winget} --id=\"${name}\"${locationArg};
              if ([int]$LASTEXITCODE -band 0xFF -eq 43) { exit 0 } else { exit $LASTEXITCODE }
            }
          '';
        in
        ''
          echo "🖥️ Installing ${name}"
          output=$(/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -NoProfile -Command '${script}')
          status=$?
          echo "PowerShell exit status: $status"
          echo "$output" | grep -v 'tcgetpgrp failed'
          exit $status
        '';
    in
    builtins.concatStringsSep "\n\n" (builtins.map installOne pkgs);
}
