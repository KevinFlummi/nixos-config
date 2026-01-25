{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
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
