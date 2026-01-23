{
  pkgs,
  dotfiles,
  ...
}: {
  home.packages = with pkgs; [
    niri # wm
    xwayland-satellite # port x-dependencies
    nsxiv # images
    thunar # file explorer
    thunar-archive-plugin # zip util
    thunar-media-tags-plugin # see media metadata
    thunar-volman # mounting
    thunderbird # email client
    spotify # music player
  ];

  stylix.targets.noctalia-shell.enable = false;
  programs.noctalia-shell = {
    enable = true;
    settings = {
      settingsVersion = 0;
      general = {
        avatarImage = "~/Pictures/avatar.jpg";
      };
      location = {
        name = "Bremen";
        showWeekNumberInCalendar = true;
      };
      colorSchemes = {
        predefinedScheme = "Rose Pine";
      };
      wallpaper = {
        directory = "~/Pictures/Wallpapers/";
        overviewEnabled = true;
      };
      bar = {
        density = "comfortable";
        showOutline = false;
        widgets = {
          left = [
            {
              id = "ControlCenter";
              useDistroLogo = true;
            }
            {
              id = "ActiveWindow";
              useFixedWidth = false;
              maxWidth = 800;
            }
          ];
          center = [
            {
              id = "Workspace";
              labelMode = "name";
              characterCount = 1;
              showLabelsOnlyWhenOccupied = false;
            }
          ];
          right = [
            {
              id = "MediaMini";
              showArtistFirst = false;
              showVisualizer = true;
              visualizerType = "linear";
            }
            {
              id = "Tray";
              enableDrawer = true;
            }
            {
              id = "plugin:screen-recorder";
            }
            {
              id = "Volume";
            }
            {
              id = "NotificationHistory";
            }
            {
              id = "KeyboardLayout";
            }
            {
              id = "Clock";
            }
          ];
        };
        dock = {
          size = 1.5;
          floatingRatio = 1.5;
          onlySameOutput = false;
        };
        controlCenter = {
          shortcuts = {
            left = [
              {
                id = "Network";
              }
              {
                id = "Bluetooth";
              }
              {
                id = "WallpaperSelector";
              }
              {
                id = "DarkMode";
              }
            ];
            right = [
              {
                id = "Notifications";
              }
              {
                id = "PowerProfile";
              }
              {
                id = "KeepAwake";
              }
              {
                id = "NightLight";
              }
            ];
          };
        };
        appLauncher = {
          enableClipboardHistory = true;
          iconMode = "native";
          terminalCommand = "kitty -e";
        };
        audio = {
          preferredPlayer = "spotify";
        };
        nightLight = {
          enabled = true;
          autoSchedule = true;
          nightTemp = "5000";
          dayTemp = "6500";
        };
      };
    };
    plugins = {
      sources = [
        {
          enabled = true;
          name = "Official Noctalia Plugins";
          url = "https://github.com/noctalia-dev/noctalia-plugins";
        }
      ];
      states = {
        screen-recorder = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        translator = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
      };
      version = 1;
    };

    pluginSettings = {
      screen-recorder = {
        resolution = "1920x1080";
        videoSource = "screen";
      };
    };
  };

  programs.mpv.enable = true; # media player

  # password manager
  programs.keepassxc = {
    enable = true;
    autostart = false; # niri handles autostart
    settings = {
      Security = {
        LockDatabaseIdle = false;
      };
      FdoSecrets = {
        Enabled = true;
        ConfirmAccessItem = false;
        UnlockBeforeSearch = false;
      };
      Browser = {
        Enabled = true;
      };
      GUI = {
        ApplicationTheme = "dark";
        CompactMode = true;
        HidePasswords = true;
      };
    };
  };
  xdg.autostart.enable = true;

  xdg.configFile."niri".source = "${dotfiles}/niri";
}
