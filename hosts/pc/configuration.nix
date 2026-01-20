{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/boot.nix
    ../../modules/nixos/bluetooth.nix
    ../../modules/nixos/wifi.nix
    ../../modules/nixos/system.nix
    ../../modules/nixos/cmdutils.nix
    ../../modules/nixos/locale.nix
    ../../modules/nixos/audio.nix
    ../../modules/nixos/users.nix
    ../../modules/nixos/nvidia.nix
    ../../modules/nixos/login.nix
    ../../modules/nixos/wayland.nix
    ../../modules/nixos/fonts.nix
    ../../modules/nixos/gaming.nix
  ];

  networking.hostName = "pc";

  # allow proprietary garbage
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  system.stateVersion = "25.11"; # Did you read the comment? (yes (=don't delete this line))
}
