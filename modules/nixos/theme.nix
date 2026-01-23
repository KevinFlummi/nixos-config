{pkgs, ...}: {
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine-moon.yaml";
    fonts = {
      serif = {
        package = pkgs.inter;
        name = "Inter";
      };
      sansSerif = {
        package = pkgs.inter;
        name = "Inter";
      };
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
    };
    icons = {
      enable = true;
      package = pkgs.rose-pine-icon-theme;
      dark = "rose-pine-moon-icons";
      light = "rose-pine-dawn-icons";
    };
    #cursor = {
    #  package = pkgs.rose-pine-cursor;
    #  #name = "BreezeX-RoséPine";
    #  name = "BreezeX-RosePine";
    #};
    opacity = {
      terminal = 0.85;
      desktop = 0.85;
      applications = 0.85;
      popups = 1.0;
    };
  };
}
