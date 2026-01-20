{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    sl # steam locomotive
    age # encryption
    sops # encryption
    ffmpeg-full # codecs
  ];

  programs.git = {
    enable = true;
    settings = {
      user.name = "Kevin Ferneding";
      user.email = "email@kevinferneding.xyz";
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };
}
