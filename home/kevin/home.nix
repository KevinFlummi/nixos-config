{ config, pkgs, ... }:

{
  home.username = "kevin";
  home.homeDirectory = "/home/kevin";
  programs.git = {
    enable = true;
    userName = "Kevin Ferneding";
    userEmail = "email@kevinferneding.xyz";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };
  home.stateVersion = "25.11";
  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo sanitycheck";
    };
  };

  xdg.configFile."niri".source = ../../modules/config/niri;
}
