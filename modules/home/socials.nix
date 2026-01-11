{pkgs, ...}: {
  home.packages = with pkgs; [
    vesktop
  ];
  catppuccin.vesktop.enable = true;
}
