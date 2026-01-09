{ pkgs, ... }:

{
  home.packages = with pkg; [
    age
    sops
  ];

  catppuccin = {
    enable = true;
    flavor = "mocha";
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
