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
    ../../modules/nixos/graphics.nix
    ../../modules/nixos/login.nix
    ../../modules/nixos/wayland.nix
    ../../modules/nixos/theme.nix
    ../../modules/nixos/gaming.nix
    ../../modules/nixos/vfx.nix
  ];

  networking.hostName = "tofu";

  # allow proprietary garbage
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  system.stateVersion = "25.11"; # Did you read the comment? (yes (=don't delete this line))
}
