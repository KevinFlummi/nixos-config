{...}: {
  imports = [
    ../../modules/home/common.nix
    ../../modules/home/terminal.nix
    ../../modules/home/editor.nix
    ../../modules/home/desktop.nix
    ../../modules/home/browser.nix
    ../../modules/home/media.nix
    ../../modules/home/gaming.nix
    ../../modules/home/socials.nix
    ../../modules/home/research.nix
  ];

  home.username = "kevin";
  home.homeDirectory = "/home/kevin";

  home.stateVersion = "25.11";
}
