{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    jq
    fd
    vim
    git
    curl
    wget
    tree
    nmap
    wev
    ripgrep
    gnupg
    gnumake
    zip
    unzip
    rar
    unrar
    ausweisapp
  ];
}
