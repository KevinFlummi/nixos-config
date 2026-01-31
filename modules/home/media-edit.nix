{
  config,
  pkgs,
  dotfiles,
  ...
}: {
  home.packages = with pkgs; [
    gimp
    kdePackages.kdenlive
    audacity
  ];
  programs.yt-dlp.enable = true;
  programs.obs-studio.enable = true;
}
