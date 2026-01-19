{pkgs, ...}: {
  home.packages = with pkgs; [
    zotero
    pandoc
    bibtex2html
  ];
}
