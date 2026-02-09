{
  pkgs,
  dotfiles,
  ...
}: {
  home.packages = with pkgs; [
    mangohud
    prismlauncher
  ];

  xdg.configFile."MangoHud".source = "${dotfiles}/MangoHud";
}
