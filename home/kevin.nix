{...}: {
  imports = [
    ../modules/home/common.nix
    ../modules/home/terminal.nix
    ../modules/home/neovim.nix
    ../modules/home/neovim-ext.nix
    ../modules/home/desktop.nix
    ../modules/home/firefox.nix
    ../modules/home/media-edit.nix
    ../modules/home/nextcloud.nix
    ../modules/home/gaming.nix
    ../modules/home/discord.nix
    ../modules/home/research.nix
  ];

  home.username = "kevin";
  home.homeDirectory = "/home/kevin";

  home.stateVersion = "25.11";
}
