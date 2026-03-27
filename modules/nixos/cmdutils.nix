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
