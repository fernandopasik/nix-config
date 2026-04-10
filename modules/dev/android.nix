{
  config,
  androidModule,
  isDarwin,
  isLinux,
  lib,
  pkgs,
  ...
}:

lib.mkMerge (
  let
    androidSdkPkg = androidModule.sdk.${pkgs.system} (
      sdkPkgs:
      with sdkPkgs;
      [
        cmdline-tools-latest
        platform-tools
        emulator

        # Platforms
        platforms-android-35
        platforms-android-36
        ndk-26-1-10909125
        ndk-27-1-12297006

        # Build tools
        build-tools-34-0-0
        build-tools-35-0-0
        build-tools-36-0-0
        cmake-3-22-1
      ]
      ++ lib.optionals (pkgs.system == "aarch64-darwin") [
        # System images (emulators)
        system-images-android-35-google-apis-arm64-v8a
        system-images-android-36-google-apis-arm64-v8a
      ]
      ++ lib.optionals (pkgs.system == "x86_64-linux" || pkgs.system == "x86_64-darwin") [
        # System images (emulators)
        system-images-android-35-google-apis-x86-64
        system-images-android-36-google-apis-x86-64
      ]
    );
  in
  [
    {
      environment = {
        systemPackages = [ androidSdkPkg ];
        pathsToLink = [ "/share/android-sdk" ];
      };

      programs.zsh.promptInit = ''
        export ANDROID_HOME="${androidSdkPkg}/share/android-sdk"
        export ANDROID_SDK_ROOT="${androidSdkPkg}/share/android-sdk"
      '';
    }

    (lib.optionalAttrs isDarwin {
      homebrew = {
        casks = [ "android-studio" ];
      };
    })
  ]
)
