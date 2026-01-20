{pkgs, ...}: {
  services.gvfs.enable = true; # virtual filesystem
  services.tumbler.enable = true; # thumbnails
  programs.dconf.enable = true; # gtk configs

  # zsh for kevin
  programs.zsh.enable = true;
  users.users.kevin = {
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager" "video"];
  };
}
