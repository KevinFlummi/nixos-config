{
  config,
  pkgs,
  dotfiles,
  ...
}: {
  imports = [
    ../../modules/home/common.nix
    ../../modules/home/terminal.nix
    ../../modules/home/editor.nix
    ../../modules/home/desktop.nix
    ../../modules/home/browser.nix
  ];

  home.username = "kevin";
  home.homeDirectory = "/home/kevin";

  home.stateVersion = "25.11";
}
