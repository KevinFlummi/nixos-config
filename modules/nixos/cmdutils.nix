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
    btop
    gnupg
    gnumake
    zip
    unzip
    rar
    unrar
  ];
  services.openssh.enable = true;
}
