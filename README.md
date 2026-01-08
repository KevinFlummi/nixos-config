# tldr App List

- WM: Wayland / Niri
- Bar: Waybar
- Launcher: Walker
- Notifications: Dunst
- Terminal: Kitty
- Shell: Zsh
- Editor: NVim
- FileMan: Thunar (or Nemo?)
- Colors: Catpucchin
- Icons: Catpucchin Nix
- Fonts: Nerd-Fonts netbeans

# Repo Organization

## Repo for nixos configuration

- nixos-config/
  - flake.nix   % high-level wiring and control point
  - flake.lock
  - hosts/ % one folder for each machine, load modules depending on needs & purpose
    ─ my-machine1/
        - hardware-configuration.nix
        ─ configuration.nix
  - modules/
    ─ nixos/   % core OS programs and utils (shell env, tools, basic wm, ...)
        ─ common.nix
        ─ users.nix
        ─ wayland.nix
        ─ networking.nix
    ─ home/   % specific apps for certain task groups (f.ex. 'gaming', 'devkit')
        ─ common.nix
        ─ devkit.nix
        ─ fun.nix
        ─ multimedia.nix
    ─ <submodule: dotfiles as config>
  - home/
    ─ myuser/ % one folder for each user instance, in here we import modules based on user prefs
        ─ home.nix
  - secrets/
    ─ (if any)
  - README.md

## Repo for linux dotfile configuration

- dotfiles/
  ─ nvim/
  ─ kitty/
  ─ niri/
  ─ ...

## Usage

- Clone nixos-config into the home folder:
  - `git clone --recurse-submodules https://github.com/KevinFlummi/nixos-config`
- Update submodule for most recent dotfiles:
  - `git submodule update --init --recursive`
- For deployment, run `sudo nixos-rebuild switch --flake ~/nixos-config#hostname-in-flake`
