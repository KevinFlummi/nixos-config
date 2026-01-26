{
  config,
  pkgs,
  ...
}: {
  stylix.targets.firefox = {
    profileNames = ["default"];
    colorTheme.enable = true;
  };
  programs.firefox = {
    enable = true;

    languagePacks = ["en-US" "de"];

    policies = {
      # Updates & Background Services
      AppAutoUpdate = false;
      BackgroundAppUpdate = false;

      # Feature Disabling
      DisableBuiltinPDFViewer = false;
      DisableFirefoxStudies = true;
      DisableFirefoxAccounts = false;
      DisableFirefoxScreenshots = true;
      DisableForgetButton = true;
      DisableMasterPasswordCreation = true;
      DisableProfileImport = true;
      DisableProfileRefresh = true;
      DisableSetDesktopBackground = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DisableFormHistory = true;
      DisablePasswordReveal = true;

      # Access Restrictions
      BlockAboutConfig = false;
      BlockAboutProfiles = false;
      BlockAboutSupport = false;

      # UI and Behavior
      DisplayMenuBar = "never";
      DontCheckDefaultBrowser = true;
      HardwareAcceleration = true;
      OfferToSaveLogins = false;
      DefaultDownloadDirectory = "${config.home.homeDirectory}/Downloads";

      ExtensionSettings = let
        moz = short: "https://addons.mozilla.org/firefox/downloads/latest/${short}/latest.xpi";
      in {
        "*".installation_mode = "allowed";

        "uBlock0@raymondhill.net" = {
          install_url = moz "ublock-origin";
          installation_mode = "force_installed";
          updates_disabled = true;
        };
        "sponsorBlocker@ajay.app" = {
          install_url = moz "sponsorblock";
          installation_mode = "force_installed";
          updates_disabled = true;
        };
        "@mute-sites-by-default" = {
          install_url = moz "mute-sites-by-default";
          installation_mode = "force_installed";
          updates_disabled = true;
        };
        "keepassxc-browser@keepassxc.org" = {
          install_url = moz "keepassxc-browser";
          installation_mode = "force_installed";
          updates_disabled = true;
        };
        "{74145f27-f039-47ce-a470-a662b129930a}" = {
          install_url = moz "clearurls";
          installation_mode = "force_installed";
          updates_disabled = true;
        };
        "{addon@darkreader.org}" = {
          install_url = moz "darkreader";
          installation_mode = "force_installed";
          updates_disabled = true;
        };
      };
    };

    profiles.default = {
      extensions.force = true;
      search = {
        force = true;
        default = "ddg";
        privateDefault = "ddg";

        engines = {
          "Nix Packages" = {
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "channel";
                    value = "unstable";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["@np"];
          };

          "Nix Options" = {
            urls = [
              {
                template = "https://search.nixos.org/options";
                params = [
                  {
                    name = "channel";
                    value = "unstable";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["@no"];
          };

          "NixOS Wiki" = {
            urls = [
              {
                template = "https://wiki.nixos.org/w/index.php";
                params = [
                  {
                    name = "search";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["@nw"];
          };
        };
      };

      settings = {
        # Startup
        "browser.startup.page" = 3;
        # Fingerprinting
        "privacy.partition.network_state" = true;
        "privacy.partition.serviceWorkers" = true;
        "privacy.partition.always_partition_third_party_non_cookie_storage" = true;
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.pbmode.enabled" = true;
        "privacy.trackingprotection.fingerprinting.enabled" = true;
        "privacy.trackingprotection.cryptomining.enabled" = true;
        "privacy.trackingprotection.emailtracking.enabled" = true;
        # Cookies & Cache
        "network.cookie.cookieBehavior" = 4;
        "browser.cache.cache_isolation" = true;
        # Networking
        "dom.security.https_only_mode" = true;
        "network.trr.mode" = 2;
        "network.trr.strict_native_fallback" = false;
        "network.http.referer.XOriginPolicy" = 1;
        "network.http.referer.XOriginTrimmingPolicy" = 2;
        # Telemetry
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.unified" = false;
        "datareporting.healthreport.uploadEnabled" = false;
        "browser.ping-centre.telemetry" = false;
        "extensions.pocket.enabled" = false;
        "extensions.formautofill.creditCards.enabled" = false;
      };
    };
  };
}
