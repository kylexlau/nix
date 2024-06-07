{...}: {
  system.defaults = {
    ## ref: https://daiderd.com/nix-darwin/manual/index.html
    loginwindow = {
      GuestEnabled = false;
      SHOWFULLNAME = false;
    };

    finder = {
      AppleShowAllExtensions = true;
      FXEnableExtensionChangeWarning = true;
      _FXShowPosixPathInTitle = true;
      ShowStatusBar = true;
    };

    trackpad = {
      ActuationStrength = 0;
      Clicking = true;
      FirstClickThreshold = 1;
      SecondClickThreshold = 1;
      TrackpadRightClick = true;
      TrackpadThreeFingerDrag = true;
    };

    # firewall
    alf = {
      # 0 = disabled 1 = enabled 2 = blocks all connections except for essential services
      globalstate = 1;
      loggingenabled = 0;
      stealthenabled = 1;
    };

    dock = {
      autohide = false;
      autohide-delay = 0.0;
      autohide-time-modifier = 1.0;
      tilesize = 50;
      static-only = false;
      showhidden = false;
      show-recents = false;
      show-process-indicators = true;
      orientation = "bottom";
      mru-spaces = false;
    };

    NSGlobalDomain = {
      ApplePressAndHoldEnabled = false;
      InitialKeyRepeat = 15;
      KeyRepeat = 1;
      AppleShowAllExtensions = true;
      AppleShowScrollBars = "Automatic";
    };
  };

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToControl = true;
  };
}
