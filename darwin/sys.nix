{ ... }: {
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
      # silent clicking = 0, default = 1
      ActuationStrength = 0;
      # enable tap to click
      Clicking = true;
      # firmness level, 0 = lightest, 2 = heaviest
      FirstClickThreshold = 1;
      # firmness level for force touch
      SecondClickThreshold = 1;
      # allow positional right click
      TrackpadRightClick = true;
      # three finger drag for space switching
      # TrackpadThreeFingerDrag = true;
    };

    # firewall settings
    alf = {
      # 0 = disabled 1 = enabled 2 = blocks all connections except for essential services
      globalstate = 1;
      loggingenabled = 0;
      stealthenabled = 1;
    };

    # dock settings
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
