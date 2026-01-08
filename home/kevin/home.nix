{ config, pkgs, ... }:

{
  home.username = "kevin";
  home.homeDirectory = "/home/kevin";
  #programs.home-manager.enable = true;
  
  home.packages = with pkgs; [ 
    neovim 
    htop
    age 
    sops
    walker
    dunst
    fastfetch
  ];

  services.walker.enable = true;

  services.dunst.enable = true;

  programs.git = {
    enable = true;
    userName = "Kevin Ferneding";
    userEmail = "email@kevinferneding.xyz";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };
  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo sanitycheck";
    };
  };
  xdg.configFile."niri".source = ../../modules/config/niri;
  xdg.configFile."walker".source = ../../modules/config/walker;
  
  home.stateVersion = "25.11";
}
