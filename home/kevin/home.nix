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
    nemo
    fastfetch
  ];

  catppuccin = {
    enable = true;
    flavor = "mocha";
    firefox.enable = true;
    gtk.enable = true;
    kitty.enable = true;
    nvim.enable = true;
  }

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
  programs.noctalia.enable = true;

  xdg.configFile."niri".source = ../../modules/config/niri;

  home.stateVersion = "25.11";
}
