{dotfiles, ...}: {
  home.sessionVariables = {
    XKB_SYMBOLS_DIR = "$HOME/nixos-config/modules/config/keyboard";
  };
  xkb = {
    layouts = ["de" "us" "mine"];
    options = ["grp:ctrl_space_toggle"];
  };
}
