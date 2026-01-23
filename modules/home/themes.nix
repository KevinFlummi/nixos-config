### Catppuccin theme
{pkgs, ...}: {
  home.packages = with pkgs; [
    libsForQt5.qt5ct # qt thingy
    catppuccin-gtk
    catppuccin-qt5ct
    catppuccin-kvantum
  ];

  home.sessionVariables.QT_QPA_PLATFORMTHEME = "qt5ct";

  gtk = {
    enable = true;
    theme = {
      name = "catppuccin-frappe-blue-standard";
      package = pkgs.catppuccin-gtk;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";
  };

  catppuccin = {
    enable = true;
    flavor = "mocha";
    cursors.enable = true;
    gtk.icon.enable = true;
    qt5ct.enable = true;
    kvantum.enable = true;
    kvantum.apply = true;
    thunderbird.enable = true;
    vesktop.enable = true;
    firefox = {
      enable = true;
      force = true;
    };
    kitty.enable = true;
  };
}
