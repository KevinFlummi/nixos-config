{pkgs, ...}: {
  home.packages = with pkgs; [
    zotero
    texliveMedium
    pandoc
    languagetool
    aspell
    aspellDicts.en
    aspellDicts.de
    zathura
    ghostscript
  ];
}
