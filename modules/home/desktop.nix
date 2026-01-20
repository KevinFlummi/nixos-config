{
  pkgs,
  dotfiles,
  ...
}: {
  home.packages = with pkgs; [
    niri # wm
    xwayland-satellite # port x-dependencies
    mpv # videos
    nsxiv # images
    keepassxc # pw manager
    thunderbird # email
    thunar # file explorer
    thunar-archive-plugin # zip util
    thunar-media-tags-plugin # see media metadata
    thunar-volman # mounting
    gpu-screen-recorder # screen recording
    spotify # music player
  ];

  programs.noctalia-shell = {
    enable = true;
  };

  xdg.configFile."niri".source = "${dotfiles}/niri";
  xdg.configFile."noctalia".source = "${dotfiles}/noctalia";
}
