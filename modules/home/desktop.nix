{
  pkgs,
  dotfiles,
  ...
}: {
  home.packages = with pkgs; [
    niri
    xwayland-satellite
    thunar
    thunar-archive-plugin
    thunar-media-tags-plugin
    thunar-volman
    catppuccin-kde
    catppuccin-gtk
  ];

  programs.noctalia-shell = {
    enable = true;
  };

  xdg.configFile."niri".source = "${dotfiles}/niri";
  xdg.configFile."noctalia".source = "${dotfiles}/noctalia";
}
