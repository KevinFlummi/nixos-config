{pkgs, ...}: {
  home.packages = with pkgs; [
    zotero
    pandoc
    texliveFull
    bibtex2html
    languagetool
    aspell
    aspellDicts.en
    aspellDicts.de
    zathura
    ghostscript
  ];
}
