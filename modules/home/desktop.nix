{ pkgs, dotfiles, ... }:

{
  home.packages = with pkgs; [
    nemo
    niri
    xwayland-satellite
  ];

  programs.noctalia-shell = {
    enable = true;
    settings = {
      colorSchemes.predefinedScheme = "Catppuccin Lavender";
    };
  };

  xdg.configFile."niri".source = "${dotfiles}/niri";
}
