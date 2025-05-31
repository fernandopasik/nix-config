{
  config,
  isDarwin,
  isLinux,
  isWSL,
  pkgs,
  lib,
  libx,
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
    system.activationScripts.postActivation.text = libx.installWingetPkgs [
      "LuculentSystems.BluetoothBatteryMonitor"
      "CPUID.CPU-Z"
      "Guru3D.Afterburner.Beta"
      "REALiX.HWiNFO"
      "Rem0o.FanControl"
    ];
  })
]
