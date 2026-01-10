{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    age
    sops
  ];

  catppuccin = {
    enable = true;
    flavor = "mocha";
    cursors.enable = true;
    cursors.accent = "mauve";
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
