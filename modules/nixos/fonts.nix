{
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
}
