{
  pkgs,
  dotfiles,
  ...
}: {
  home.packages = with pkgs; [
    niri # wm
    xwayland-satellite # port x-dependencies
    catppuccin-gtk # theme
    catppuccin-qt5ct # theme
    catppuccin-kvantum # theme
    mpv # videos
    nsxiv # images
    keepassxc # pw manager
    thunderbird # email
    thunar # file explorer
    thunar-archive-plugin # zip util
    thunar-media-tags-plugin # see media metadata
    thunar-volman # mounting
  ];

  catppuccin = {
    cursors.enable = true;
    gtk.icon.enable = true;
    qt5ct.enable = true;
    kvantum.enable = true;
    kvantum.apply = true;
  };

  gtk = {
    enable = true;
    theme = {
      name = "catppuccin-frappe-blue-standard";
      package = pkgs.catppuccin-gtk;
    };
  };

  xdg.configFile."niri".source = "${dotfiles}/niri";
  xdg.configFile."noctalia".source = "${dotfiles}/noctalia";
}
