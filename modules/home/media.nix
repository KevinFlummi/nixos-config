{
  config,
  pkgs,
  dotfiles,
  ...
}: {
  home.packages = with pkgs; [
    gimp
    yt-dlp
    kdePackages.kdenlive
    audacity
    obs-studio
    gpu-screen-recorder
    spotify
  ];
}
