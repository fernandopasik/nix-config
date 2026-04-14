{
  config,
  isDarwin,
  isLinux,
  isWSL,
  pkgs,
  lib,
  ...
}:
lib.mkMerge [
  (lib.optionalAttrs isDarwin {
    homebrew.casks = [
      "stats"
      "tg-pro"
    ];
  })

  (lib.optionalAttrs isWSL {
    winget.packages = [
      "LuculentSystems.BluetoothBatteryMonitor"
      "CPUID.CPU-Z"
      "Guru3D.Afterburner.Beta"
      "REALiX.HWiNFO"
      "Rem0o.FanControl"
    ];
  })
]
