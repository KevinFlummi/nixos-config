{ pkgs, dotfiles, ... }:

{
  home.packages = with pkgs; [
    htop
    fastfetch
  ];

  catppuccin.nvim.enable = true;
  programs.neovim = {
    enable = true;
    defaultEditor = true;
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

  catppuccin.kitty.enable = true;
  programs.kitty = {
    enable = true;
    settings = {
      background_opacity = "0.5";
    };
  };
  
  xdg.configFile."nvim".source = "${dotfiles}/nvim";
}
