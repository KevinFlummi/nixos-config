{pkgs, ...}: {
  catppuccin.firefox.enable = true;
  programs.firefox = {
    enable = true;

    profiles.default = {
      id = 0;
      name = "default";

      settings = {
        # --- Privacy / Tracking ---
        "privacy.resistFingerprinting" = true;
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
        "privacy.donottrackheader.enabled" = true;

        # --- Network / Telemetry ---
        "network.dns.disablePrefetch" = true;
        "network.prefetch-next" = false;
        "network.http.speculative-parallel-limit" = 0;
        "network.predictor.enabled" = false;

        "datareporting.healthreport.uploadEnabled" = false;
        "datareporting.policy.dataSubmissionEnabled" = false;
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.server" = "";
        "browser.ping-centre.telemetry" = false;

        # --- Safe Defaults ---
        "browser.safebrowsing.malware.enabled" = true;
        "browser.safebrowsing.phishing.enabled" = true;

        # --- WebRTC Leak Protection ---
        "media.peerconnection.ice.default_address_only" = true;
        "media.peerconnection.ice.no_host" = true;

        # --- Cookies / Storage ---
        "network.cookie.cookieBehavior" = 1; # block 3rd-party cookies
        "privacy.partition.network_state" = true;

        # --- HTTPS ---
        "dom.security.https_only_mode" = true;
      };
    };
  };
}
