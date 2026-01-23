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
    #cursor = {
    #  package = pkgs.rose-pine-cursor;
    #  name = "BreezeX-RoséPine";
    #};
    opacity = {
      terminal = 0.85;
      desktop = 0.85;
      applications = 0.85;
      popups = 1.0;
    };
  };
}
