{pkgs, ...}: {
  home.packages = with pkgs; [
    age
    sops
    colloid-gtk-theme
    colloid-icon-theme
  ];

  catppuccin = {
    enable = true;
    flavor = "mocha";
    cursors.enable = true;
    catppuccin.cursors.accent = "mauve"
  };
  gtk = {
    enable = true;

    theme = {
      name = "Colloid-Dark-Catppuccin"; # or another variant
      package = pkgs.colloid-gtk-theme;
    };

    iconTheme = {
      name = "Colloid-Catppuccin";
      package = pkgs.colloid-icon-theme;
    };

    cursorTheme = {
      name = "Colloid-Catppuccin";
      package = pkgs.colloid-cursors;
    };
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
}
