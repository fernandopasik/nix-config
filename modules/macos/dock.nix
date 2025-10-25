{ config, pkgs, ... }:
{
  system = {
    defaults = {
      CustomUserPreferences = {
        "com.apple.dock" = {
          dblclickbehavior = "maximize";
          springboard-columns = 9;
          springboard-rows = 5;
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

        persistent-apps = [
          "/System/Applications/Apps.app"
          "/Applications/Google Chrome.app"
          "/System/Applications/Facetime.app"
          "/System/Applications/Messages.app"
          "/Applications/WhatsApp.app"
          "/System/Applications/Notes.app"
        ];
      };
    };
  };
}
