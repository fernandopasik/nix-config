{ config, pkgs, ... }:
{
  homebrew.casks = [
    # QuickLook plugins
    "qlcolorcode"
    "qlmarkdown"
    "qlstephen"
    "quicklook-csv"
    "quicklook-json"
    "webpquicklook"
  ];

  system = {
    defaults = {
      CustomUserPreferences = {
        "com.apple.finder" = {
          EmptyTrashSecurely = true;
          _FXCalculateAllSizes = true;
          FXICloudDriveDesktop = true;
          FXICloudDriveDocuments = true;
          FXICloudDriveEnabled = true;
          WarnOnEmptyTrash = true;
        };
      };

      finder = {
        _FXShowPosixPathInTitle = false;
        _FXSortFoldersFirst = true;
        _FXSortFoldersFirstOnDesktop = true;
        AppleShowAllExtensions = false;
        AppleShowAllFiles = false;
        CreateDesktop = true;
        FXDefaultSearchScope = "SCcf";
        FXEnableExtensionChangeWarning = false;
        FXPreferredViewStyle = "Nlsv";
        FXRemoveOldTrashItems = false;
        NewWindowTarget = "Home";
        QuitMenuItem = true;
        ShowExternalHardDrivesOnDesktop = false;
        ShowHardDrivesOnDesktop = false;
        ShowMountedServersOnDesktop = false;
        ShowPathbar = false;
        ShowRemovableMediaOnDesktop = false;
        ShowStatusBar = false;
      };
    };
  };
}
