{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    jq
    fd
    ssh
    vim
    git
    curl
    wget
    tree
    nmap
    ripgrep
    btop
    gnupg
    gnumake
    zip
    unzip
    rar
    unrar
  ];
}
