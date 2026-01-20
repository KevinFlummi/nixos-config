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
    gpu-screen-recorder # screen recording
  ];

  programs.noctalia-shell = {
    enable = true;
  };

  programs.mpv.enable = true; # media player

  # todo: move thunderbird config to homemgr
  #programs.thunderbird.enable = true; # email client

  # password manager
  programs.keepassxc = {
    enable = true;
    autostart = true;
    settings = {
      FdoSecrets.Enabled = true;
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
  xdg.configFile."noctalia".source = "${dotfiles}/noctalia";
}
