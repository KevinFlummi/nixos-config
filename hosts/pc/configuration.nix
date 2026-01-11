{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/gaming.nix
  ];
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

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

  # graphics drivers
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia.open = false;
  hardware.nvidia.modesetting.enable = true;
  # (tbd: add cuda support)

  # audio
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };

  # locale
  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "de";

  # zsh for kevin
  programs.zsh.enable = true;
  users.users.kevin = {
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = ["wheel"];
  };

  environment.systemPackages = with pkgs; [
    fd
    vim
    git
    curl
    wget
    tree
    nmap
    ripgrep
    btop
    gnupg
    gnumake
    zip
    unzip
    rar
    unrar
    fastfetch
  ];

  # minimalist login manager
  services.greetd.enable = true;
  services.greetd.settings.default_session = {
    command = "${pkgs.tuigreet}/bin/tuigreet --time 
    --user-menu --user-menu-min-uid 1000 --user-menu-max-uid 1005
    --cmd ${pkgs.niri}/bin/niri-session";
    user = "greeter";
  };

  # wayland ports
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  programs.xwayland.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-wlr
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  # the only two relevant fonts
  fonts.packages = with pkgs; [
    inter
    nerd-fonts.jetbrains-mono
  ];
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = ["Inter"];
      sansSerif = ["Inter"];
      monospace = ["JetBrainsMono Nerd Font"];
    };
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];

  system.stateVersion = "25.11"; # Did you read the comment? (yes (=don't delete this line))
}
