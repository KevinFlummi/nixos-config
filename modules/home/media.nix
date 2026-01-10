{
  config,
  pkgs,
  dotfiles,
  ...
}: {
  home.packages = with pkgs; [
    mpv
    vlc
    gimp
    yt-dlp
    ffmpeg-full
    kdePackages.kdenlive
    audacity
    obs-studio
    spotify-player
  ];

  catppuccin.mpv.enable = true;
  catppuccin.obs.enable = true;
  catppuccin.spotify-player.enable = true;
}
