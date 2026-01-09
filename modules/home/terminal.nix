{pkgs, ...}: {
  home.packages = with pkgs; [
    htop
    fastfetch
  ];

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
}
