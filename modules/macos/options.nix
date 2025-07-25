{ config, pkgs, ... }:
{
  system = {
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

        "com.apple.AdLib" = {
          allowApplePersonalizedAdvertising = false;
        };

        "com.apple.BezelServices" = {
          kDim = true;
          kDimTime = 300;
        };

        "com.apple.bird" = {
          optimize-storage = false;
        };

        "com.apple.commerce" = {
          AutoUpdate = true;
        };

        "com.apple.desktopservices" = {
          DSDontWriteNetworkStores = true;
          DSDontWriteUSBStores = true;
        };

        "com.apple.driver.AppleBluetoothMultitouch.trackpad" = {
          Clicking = 1;
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

        "com.apple.SoftwareUpdate" = {
          AutomaticCheckEnabled = true;
          ScheduleFrequency = 1;
          AutomaticDownload = 1;
          CriticalUpdateInstall = 1;
        };

        "com.apple.TimeMachine" = {
          DoNotOfferNewDisksForBackup = true;
        };

        system.defaults.loginwindow.SHOWOTHERUSERS_MANAGED = false;
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
  };
}
