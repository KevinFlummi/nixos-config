{
  # zsh for kevin
  programs.zsh.enable = true;
  users.users.kevin = {
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = ["wheel"];
  };
}
