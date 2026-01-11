{
  config,
  pkgs,
  dotfiles,
  ...
}: {
  home.packages = with pkgs; [
    ruff # Python
    alejandra # Nix
    shfmt # Shell
    stylua # Lua
    # JSON / YAML / Markdown / HTML / JS / TS
    nodePackages.prettier
    taplo # TOML
    rustfmt # Rust
    go # Go
    go-tools # Go
    clang-tools # C / C++ / Java / ObjC
    dockfmt # Docker
    sqlfluff # SQL
  ];

  programs.neovim.enable = true;
  xdg.configFile."nvim".source = "${dotfiles}/nvim";
}
