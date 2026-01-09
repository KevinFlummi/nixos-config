{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "pc";

  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;
  services.tuned.enable = true;
  services.upower.enable = true;
  services.openssh.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "de";

  users.users.kevin = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };

  environment.systemPackages = with pkgs; [
    vim
    git
    wget
    kitty
    xwayland-satellite
    niri
    inputs.noctalia.packages.${system}.default
  ];

  services.greetd.enable = true;
  services.greetd.settings.default_session = {
    command = "${pkgs.niri}/bin/niri-session";
    user = "kevin";
  };
  programs.xwayland.enable = true;
  programs.firefox.enable = true;
  programs.niri.enable = true;

  services.gvfs.enable = true;
  services.tumbler.enable = true;
  fonts.packages = with pkgs; [
    inter
    nerd-fonts.jetbrains-mono
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.11"; # Did you read the comment? (yes (=don't delete this line))

}
