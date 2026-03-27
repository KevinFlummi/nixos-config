{pkgs, ...}: {
  home.packages = with pkgs; [
    zotero
    pandoc
    calibre
    texliveFull
    bibtex2html
    ghostscript
  ];
}
