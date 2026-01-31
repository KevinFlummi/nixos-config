{
  config,
  pkgs,
  dotfiles,
  ...
}: {
  home.packages = with pkgs; [
    gimp
    shotcut
    audacity
  ];
  programs.yt-dlp.enable = true;
  programs.obs-studio.enable = true;
}
