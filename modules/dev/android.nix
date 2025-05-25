{
  config,
  androidModule,
  isDarwin,
  isLinux,
  lib,
  pkgs,
  ...
}:
lib.mkMerge [
  {
    environment.systemPackages = [
      (androidModule.sdk.${pkgs.system} (
        sdkPkgs: with sdkPkgs; [
          cmdline-tools-latest
          platform-tools
          emulator

          # Multiple platforms
          platforms-android-35
          platforms-android-36

          # Multiple build tools
          build-tools-35-0-0
          build-tools-36-0-0

          # System images (emulators)
          system-images-android-35-google-apis-x86-64
          system-images-android-36-google-apis-x86-64
        ]
      ))
    ];
  }
  (lib.optionalAttrs isDarwin {
    homebrew = {
      casks = [
        "android-commandlinetools"
        "android-platform-tools"
        "android-studio"
      ];
    };
  })
]
