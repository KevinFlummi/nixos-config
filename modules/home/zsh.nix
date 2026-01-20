{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    shellAliases = {
      btw = "echo i use NixOS with zsh btw";
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
    history = {
      path = "$HOME/.zsh_history";
      size = 10000;
      save = 10000;
      append = true;
      share = false;
    };
    initContent = "bindkey -v";
    defaultKeymap = "viins";
    setOptions = ["NO_BEEP"];
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
}