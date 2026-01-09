{ config, pkgs, dotfiles, ... }:

{
  home.username = "kevin";
  home.homeDirectory = "/home/kevin";

  home.packages = with pkgs; [
    neovim
    htop
    age
    sops
    nemo
    niri
    fastfetch
    xwayland-satellite
  ];

  catppuccin = {
    enable = true;
    flavor = "mocha";
    firefox.enable = true;
    gtk.icon.enable = true;
    kitty.enable = true;
    nvim.enable = true;
  };

  programs.git = {
    enable = true;
    settings = {
      user.name = "Kevin Ferneding";
      user.email = "email@kevinferneding.xyz";
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };
  programs.zsh = {
    enable = true;
    shellAliases = {
      btw = "echo i use NixOS with zsh btw";
      vim = "nvim";
    };
  };
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.kitty = {
    enable = true;
  };
  programs.noctalia-shell = {
    enable = true;
    settings = {
      colorSchemes.predefinedScheme = "Catppuccin Lavender";
    };
  };
  programs.firefox.enable = true;

  xdg.configFile."niri".source = "${dotfiles}/niri";

  home.stateVersion = "25.11";
}
