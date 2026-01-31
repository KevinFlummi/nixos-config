{
  # Enable XDG MIME defaults
  xdg.enable = true;
  xdg.mimeApps.enable = true;

  # Default applications for MIME types
  xdg.mimeApps.defaultApplications = {
    # Text → kitty + nvim
    "text/plain" = "kitty-nvim.desktop";
    "text/markdown" = "kitty-nvim.desktop";
    "application/json" = "kitty-nvim.desktop";
    "application/xml" = "kitty-nvim.desktop";
    "application/x-yaml" = "kitty-nvim.desktop";
    "application/x-toml" = "kitty-nvim.desktop";
    "application/x-shellscript" = "kitty-nvim.desktop";

    # Images → nsxiv
    "image/jpeg" = "nsxiv.desktop";
    "image/png" = "nsxiv.desktop";
    "image/gif" = "nsxiv.desktop";
    "image/webp" = "nsxiv.desktop";
    "image/svg+xml" = "nsxiv.desktop";
    "image/tiff" = "nsxiv.desktop";

    # Documents → zathura
    "application/pdf" = "zathura.desktop";
    "application/epub+zip" = "zathura.desktop";
    "application/x-fictionbook+xml" = "zathura.desktop";
    "application/postscript" = "zathura.desktop";

    # Video → mpv
    "video/mp4" = "mpv.desktop";
    "video/x-matroska" = "mpv.desktop";
    "video/webm" = "mpv.desktop";
    "video/x-msvideo" = "mpv.desktop";
    "video/quicktime" = "mpv.desktop";

    # Audio → mpv
    "audio/mpeg" = "mpv.desktop";
    "audio/flac" = "mpv.desktop";
    "audio/ogg" = "mpv.desktop";
    "audio/x-wav" = "mpv.desktop";
    "audio/x-m4a" = "mpv.desktop";
  };

  # Declarative .desktop entries
  xdg.desktopEntries = {
    kitty-nvim = {
      name = "Neovim (kitty)";
      exec = "kitty -e nvim %F";
      terminal = false;
      type = "Application";
      mimeType = [
        "text/plain"
        "text/markdown"
        "application/json"
        "application/xml"
        "application/x-yaml"
        "application/x-toml"
        "application/x-shellscript"
      ];
    };

    nsxiv = {
      name = "nsxiv";
      exec = "nsxiv %F";
      terminal = false;
      type = "Application";
      mimeType = [
        "image/jpeg"
        "image/png"
        "image/gif"
        "image/webp"
        "image/svg+xml"
        "image/tiff"
      ];
    };

    zathura = {
      name = "Zathura";
      exec = "zathura %F";
      terminal = false;
      type = "Application";
      mimeType = [
        "application/pdf"
        "application/epub+zip"
        "application/x-fictionbook+xml"
        "application/postscript"
      ];
    };

    mpv = {
      name = "mpv";
      exec = "mpv %F";
      terminal = false;
      type = "Application";
      mimeType = [
        "video/mp4"
        "video/x-matroska"
        "video/webm"
        "video/x-msvideo"
        "video/quicktime"
        "audio/mpeg"
        "audio/flac"
        "audio/ogg"
        "audio/x-wav"
        "audio/x-m4a"
      ];
    };
  };
}
