{
  pkgs,
  dotfiles,
  ...
}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      # generic
      plenary-nvim
      # themes
      catppuccin-nvim
      rose-pine
      # separate
      nvim-autopairs
      nvim-colorizer-lua
      vim-fugitive
      lualine-nvim
      telescope-nvim
      undotree
    ];
  };
  xdg.configFile."nvim".source = "${dotfiles}/nvim";
}
