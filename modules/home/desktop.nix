{ pkgs, dotfiles, ... }:

{
  home.packages = with pkgs; [
    nemo
    niri
    xwayland-satellite
  ];

  programs.noctalia-shell = {
    enable = true;
  };

  xdg.configFile."niri".source = "${dotfiles}/niri";
  xdg.configFile."noctalia".source = "${dotfiles}/noctalia";
}
