{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    shellAliases = {
      btw = "echo i use NixOS with zsh btw";
      vim = "nvim";
      cl = "clear";
      nrb = "sudo nixos-rebuild switch --flake";
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
      background_opacity = "0.75";
    };
  };
}
