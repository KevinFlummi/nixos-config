{ config, pkgs, dotfiles, ... }:

{
  home.packages = with pkgs; [
    ruff   # Python
    alejandra   # Nix
    shfmt   # Shell
    stylua   # Lua
    nodePackages.prettier   # JSON / YAML / Markdown / HTML / JS / TS
    taplo   # TOML
    tidy   # XML
    rustfmt   # Rust
    go   # Go   # C / C++ / Java / ObjC
    go-tools
    clang-tools
    dockfmt   # Docker
    terraform   # Terraform / HCL
    sqlfluff   # SQL
    buf   # Protobuf
  ];

  catppuccin.nvim.enable = true;
  programs.neovim.enable = true;
  xdg.configFile."nvim".source = "${dotfiles}/nvim";

}
