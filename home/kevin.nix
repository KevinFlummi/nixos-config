{...}: {
  imports = [
    ../modules/home/common.nix
    ../modules/home/zsh.nix
    ../modules/home/terminal.nix
    ../modules/home/neovim.nix
    ../modules/home/neovim_ext.nix
    ../modules/home/desktop.nix
    ../modules/home/themes.nix
    ../modules/home/firefox.nix
    ../modules/home/mediaedit.nix
    ../modules/home/nextcloud.nix
    ../modules/home/gaming.nix
    ../modules/home/discord.nix
    ../modules/home/research.nix
  ];

  home.username = "kevin";
  home.homeDirectory = "/home/kevin";

  home.stateVersion = "25.11";
}
