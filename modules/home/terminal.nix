{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    shellAliases = {
      btw = "echo i use NixOS with zsh btw";
      vim = "nvim";
      cl = "clear";
      nrb = "sudo nixos-rebuild switch --flake";
      nup = "nix flake update";
      gits = "git status";
      gitc = "git commit";
      gitps = "git push";
      gitpl = "git pull";
    };
    autosuggestion.enable = true;
    syntaxHighlighting = {
      enable = true;
      package = pkgs.zsh-syntax-highlighting;
      highlighters = [
        "main"
        "brackets"
        "root"
      ];
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
