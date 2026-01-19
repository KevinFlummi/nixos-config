{pkgs, ...}: {
  home.packages = with pkgs; [
    zotero
    pandoc
    texliveFull
    bibtex2html
    ghostscript
  ];
}
