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
    haskell-language-server # Haskell
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
    ormolu # Haskell
    dockfmt # Docker
    texlivePackages.latexindent # LaTeX
    #######################################
    # Other tools
    #######################################
    zathura # PDF viewer
    aspell # Spell checker
    aspellDicts.en # English dictionary
    aspellDicts.de # German dictionary
  ];

  programs.neovim = {
    extraPackages = with pkgs; [
      nodejs_25 # needed for copilot-lua
    ];
    plugins = with pkgs.vimPlugins; [
      # generic
      vim-be-good
      # separate
      cellular-automaton-nvim
      blink-cmp
      conform-nvim
      #copilot-lua
      #blink-copilot
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
      nvim-treesitter-parsers.haskell
      nvim-treesitter-parsers.dockerfile
      nvim-lspconfig
      vimtex
    ];
  };
}
