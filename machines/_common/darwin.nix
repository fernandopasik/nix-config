{
  config,
  lib,
  pkgs,
  ...
}:

{
  homebrew.enable = true;

  homebrew.casks = [
    # Essentials
    "1password"
    "google-chrome"
    "google-drive"
    "spotify"
    "stats"
    "the-unarchiver"
    "vlc"

    # Chat
    "whatsapp"
    "zoom"

    # QuickLook plugins
    "qlcolorcode"
    "qlmarkdown"
    "qlstephen"
    "quicklook-csv"
    "quicklook-json"
    "webpquicklook"
  ];

  system = {
    activationScripts.postActivation.text = ''
      echo "🧹 Removing background services..."
      rm -f /Library/LaunchDaemons/us.zoom.*
      rm -f /Library/LaunchAgents/us.zoom.*
      rm -f /Library/LaunchAgents/com.gog.*
    '';

    defaults = {
      controlcenter = {
        AirDrop = false;
        BatteryShowPercentage = true;
        Bluetooth = false;
        Display = false;
        FocusModes = false;
        NowPlaying = false;
        Sound = false;
      };

      CustomUserPreferences = {
        "com.apple.ActivityMonitor" = {
          IconType = 5;
          OpenMainWindow = true;
          ShowCategory = 101;
          SortColumn = "CPUUsage";
          SortDirection = 0;
        };

        "com.apple.BezelServices" = {
          kDim = true;
          kDimTime = 300;
        };

        "com.apple.dock" = {
          dblclickbehavior = "maximize";
          springboard-columns = 9;
          springboard-rows = 5;
        };

        "com.apple.driver.AppleBluetoothMultitouch.trackpad" = {
          Clicking = 1;
        };

        "com.apple.finder" = {
          EmptyTrashSecurely = true;
          _FXCalculateAllSizes = true;
          WarnOnEmptyTrash = true;
        };

        "com.apple.ImageCapture" = {
          disableHotPlug = true;
        };

        "com.apple.LaunchServices" = {
          LSQuarantine = false;
        };

        "com.apple.messageshelper.MessageController" = {
          automaticEmojiSubstitutionEnablediMessage = false;
          automaticQuoteSubstitutionEnabled = false;
          continuousSpellCheckingEnabled = false;
        };

        "com.apple.TimeMachine" = {
          DoNotOfferNewDisksForBackup = true;
        };
      };

      dock = {
        appswitcher-all-displays = true;
        autohide = true;
        autohide-delay = 0.1;
        autohide-time-modifier = 0.5;
        dashboard-in-overlay = true;
        enable-spring-load-actions-on-all-items = true;
        expose-animation-duration = 0.5;
        expose-group-apps = true;
        largesize = 80;
        launchanim = true;
        magnification = false;
        mineffect = "suck";
        minimize-to-application = true;
        mouse-over-hilite-stack = true;
        mru-spaces = false;
        orientation = "bottom";
        persistent-apps = [
          "/System/Applications/Apps.app"
          "/Applications/Google Chrome.app"
          "/System/Applications/Facetime.app"
          "/System/Applications/Messages.app"
          "/Applications/WhatsApp.app"
        ];
        scroll-to-open = false;
        show-process-indicators = true;
        show-recents = false;
        showhidden = true;
        slow-motion-allowed = true;
        static-only = false;
        tilesize = 60;
        wvous-bl-corner = 1;
        wvous-br-corner = 1;
        wvous-tl-corner = 10;
        wvous-tr-corner = 1;
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
        FXPreferredViewStyle = "clmv";
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

      loginwindow = {
        DisableConsoleAccess = false;
        GuestEnabled = false;
        PowerOffDisabledWhileLoggedIn = false;
        RestartDisabled = false;
        RestartDisabledWhileLoggedIn = false;
        SleepDisabled = false;
        ShutDownDisabled = false;
        ShutDownDisabledWhileLoggedIn = false;
      };

      menuExtraClock = {
        FlashDateSeparators = false;
        IsAnalog = false;
        Show24Hour = true;
        ShowAMPM = false;
        ShowDate = 1;
        ShowDayOfMonth = true;
        ShowDayOfWeek = true;
        ShowSeconds = false;
      };

      NSGlobalDomain = {
        "com.apple.keyboard.fnState" = false;
        "com.apple.mouse.tapBehavior" = 1;
        "com.apple.sound.beep.feedback" = 1;
        "com.apple.sound.beep.volume" = 1.0;
        "com.apple.springing.delay" = 0.3;
        "com.apple.springing.enabled" = true;
        "com.apple.swipescrolldirection" = true;
        "com.apple.trackpad.enableSecondaryClick" = true;
        "com.apple.trackpad.forceClick" = true;
        "com.apple.trackpad.scaling" = 1.0;
        AppleFontSmoothing = 1;
        AppleICUForce24HourTime = true;
        AppleInterfaceStyle = "Dark";
      };

      screencapture = {
        disable-shadow = true;
        include-date = true;
        location = "~/Downloads";
        show-thumbnail = true;
        target = "file";
        type = "png";
      };

      screensaver = {
        askForPassword = true;
        askForPasswordDelay = 0;
      };

      SoftwareUpdate = {
        AutomaticallyInstallMacOSUpdates = true;
      };
    };

    primaryUser = "fernando";

    stateVersion = 6;
  };
}
