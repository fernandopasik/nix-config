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
        platforms-android-36
        platforms-android-37-0
        ndk-27-3-13750724

        # Build tools
        build-tools-36-0-0
        build-tools-37-0-0
        cmake-3-31-6
      ]
      ++ lib.optionals (pkgs.system == "aarch64-darwin") [
        # System images (emulators)
        system-images-android-36-google-apis-arm64-v8a
      ]
      ++ lib.optionals (pkgs.system == "x86_64-linux" || pkgs.system == "x86_64-darwin") [
        # System images (emulators)
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
