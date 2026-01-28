{
  pkgs,
  config,
  ...
}: {
  programs.zsh = {
    enable = true;
    shellAliases = {
      btw = "echo ${config.home.homeDirectory}";
      cl = "clear";
      hist = "history";
      ls = "ls -l";
      nrb = "sudo nixos-rebuild switch --flake";
      nup = "nix flake update";
      gits = "git status";
      gitc = "git commit";
      gitps = "git push";
      gitpl = "git pull";
      zt = "zathura";
    };
    sessionVariables = {
      # the classics
      EDITOR = "nvim";
      BROWSER = "firefox";
      MAILER = "thunderbird";
      TERMINAL = "kitty";
      # bookmarks
      conf = "${config.home.homeDirectory}/nixos-config";
      dots = "${config.home.homeDirectory}/nixos-config/modules/config";
      hs = "${config.home.homeDirectory}/Nextcloud/Programmierzeug/haskell";
      thesis = "${config.home.homeDirectory}/Nextcloud/Uni/DTU/Thesis";
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
      path = "${config.home.homeDirectory}/.zsh_history";
      size = 10000;
      save = 10000;
      append = true;
      share = false;
    };
    initContent = ''
      bindkey -v
      fastfetch
    '';
    defaultKeymap = "viins";
    setOptions = ["NO_BEEP"];
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.tmux = {
    enable = true;
    clock24 = true;
    mouse = true;
    keyMode = "vi";
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.kitty = {
    enable = true;
  };
}
