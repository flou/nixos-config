{ lib, ... }:

{
  nix.enable = false;
  nixpkgs.hostPlatform = lib.mkDefault "aarch64-darwin";

  programs.zsh.enable = true;
  programs.zsh.enableGlobalCompInit = false;
  programs.zsh.shellInit = ''
    if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
      . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
    fi
  '';

  security.pam.services.sudo_local.touchIdAuth = true;

  system.stateVersion = 4;

  system.defaults = {
    CustomUserPreferences = {
      "com.apple.Siri" = {
        "UAProfileCheckingStatus" = 0;
        "siriEnabled" = 0;
      };
      "com.apple.AdLib" = {
        allowApplePersonalizedAdvertising = false;
      };
      "com.apple.desktopservices" = {
        DSDontWriteNetworkStores = true;
        DSDontWriteUSBStores = true;
      };
    };

    NSGlobalDomain."com.apple.keyboard.fnState" = false;
    NSGlobalDomain."com.apple.swipescrolldirection" = true;
    NSGlobalDomain.AppleEnableSwipeNavigateWithScrolls = true;
    NSGlobalDomain.AppleShowAllExtensions = true;
    NSGlobalDomain.AppleShowScrollBars = "WhenScrolling";
    NSGlobalDomain.InitialKeyRepeat = 15;
    NSGlobalDomain.KeyRepeat = 1;
    NSGlobalDomain.NSAutomaticCapitalizationEnabled = false;
    NSGlobalDomain.NSAutomaticDashSubstitutionEnabled = false;
    NSGlobalDomain.NSAutomaticInlinePredictionEnabled = false;
    NSGlobalDomain.NSAutomaticPeriodSubstitutionEnabled = false;
    NSGlobalDomain.NSAutomaticQuoteSubstitutionEnabled = false;
    NSGlobalDomain.NSAutomaticSpellingCorrectionEnabled = false;
    NSGlobalDomain.NSDocumentSaveNewDocumentsToCloud = false;

    controlcenter.BatteryShowPercentage = true;

    dock.autohide = true;
    dock.autohide-delay = 0.1;
    dock.autohide-time-modifier = 0.1;
    dock.mineffect = "genie";
    dock.magnification = false;
    dock.show-recents = false;
    dock.mru-spaces = false;
    dock.tilesize = 52;

    finder.FXPreferredViewStyle = "Nlsv";
    finder.NewWindowTarget = "Home";
    finder.QuitMenuItem = true;
    finder.ShowPathbar = true;
    finder.ShowStatusBar = true;

    hitoolbox.AppleFnUsageType = "Do Nothing";

    screencapture.location = "~/Pictures/screenshots";

    trackpad.Clicking = true;
    trackpad.Dragging = true;
    trackpad.TrackpadRightClick = true;
    trackpad.TrackpadThreeFingerDrag = false;
    trackpad.FirstClickThreshold = 2;
    trackpad.SecondClickThreshold = 2;
    trackpad.ActuateDetents = true;
    trackpad.ActuationStrength = 1;
    trackpad.DragLock = true;
    trackpad.ForceSuppressed = false;
  };

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToControl = true;
  };
}
