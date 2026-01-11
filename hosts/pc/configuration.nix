{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/boot.nix
    ../../modules/nixos/cmdutils.nix
    ../../modules/nixos/locale.nix
    ../../modules/nixos/audio.nix
    ../../modules/nixos/audio.nix
    ../../modules/nixos/graphics.nix
    ../../modules/nixos/login.nix
    ../../modules/nixos/wayland.nix
    ../../modules/nixos/fonts.nix
    ../../modules/nixos/gaming.nix
  ];

  networking.hostName = "pc";

  # allow proprietary garbage
  nixpkgs.config.allowUnfree = true;

  # some services
  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;
  services.tuned.enable = true;
  services.upower.enable = true;
  services.openssh.enable = true;
  services.gvfs.enable = true;
  services.tumbler.enable = true;
  programs.dconf.enable = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  system.stateVersion = "25.11"; # Did you read the comment? (yes (=don't delete this line))
}
