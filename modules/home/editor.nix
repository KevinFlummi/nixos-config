{
  pkgs,
  dotfiles,
  ...
}: {
  home.packages = with pkgs; [
    #######################################
    # Language servers
    #######################################
    ty # Python
    nixd # Nix
    bash-language-server # Shell
    lua-language-server # Lua
    marksman # Markdown
    rust-analyzer # Rust
    llvmPackages.clangWithLibcAndBasicRtAndLibcxx # C / C++ / ObjC
    texlab # LaTeX
    #######################################
    # Formatters
    #######################################
    ruff # Python
    alejandra # Nix
    shfmt # Shell
    stylua # Lua
    nodePackages.prettier # JSON / YAML / Markdown / HTML / JS / TS
    taplo # TOML
    rustfmt # Rust
    clang-tools # C / C++ / ObjC
    dockfmt # Docker
    texlivePackages.latexindent # LaTeX
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      # generic
      plenary-nvim
      vim-be-good
      copilot-vim
      # themes
      catppuccin-nvim
      rose-pine
      # separate
      nvim-autopairs
      cellular-automaton-nvim
      nvim-colorizer-lua
      blink-cmp
      conform-nvim
      vim-fugitive
      lualine-nvim
      telescope-nvim
      nvim-treesitter
      nvim-treesitter-parsers.python
      nvim-treesitter-parsers.nix
      nvim-treesitter-parsers.bash
      nvim-treesitter-parsers.lua
      nvim-treesitter-parsers.toml
      nvim-treesitter-parsers.json
      nvim-treesitter-parsers.yaml
      nvim-treesitter-parsers.markdown
      nvim-treesitter-parsers.html
      nvim-treesitter-parsers.javascript
      nvim-treesitter-parsers.typescript
      nvim-treesitter-parsers.tsx
      nvim-treesitter-parsers.rust
      nvim-treesitter-parsers.c
      nvim-treesitter-parsers.cpp
      nvim-treesitter-parsers.dockerfile
      undotree
      vimtex
    ];
  };
  xdg.configFile."nvim".source = "${dotfiles}/nvim";
}
