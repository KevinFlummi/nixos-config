# tldr Main App List

- WM: Wayland / Niri
- Desktop Shell: Noctalia
- Terminal: Kitty
- Shell: Zsh
- Editor: NVim
- FileMan: Thunar
- Colors: Rose-Pine Moon
- Fonts: Nerd-Fonts Jetbrains & Inter

# Repo Organization

## Repo for nixos configuration

- nixos-config/
  - flake.nix % high-level wiring and control point
  - flake.lock
  - hosts/ % one dir for each machine, load modules depending on needs & purpose
    - pc/
      - hardware-configuration.nix
      - configuration.nix
  - modules/
    - nixos/ % core OS config and utils
      - ...
    - home/ % user-level applications
      - ...
    - dotfiles % submodule of my dotfiles for all necessary xdg configuration
  - home/
    - kevin.nix % one file for each user instance, in here we import modules based on user prefs
  - secrets/ % managed with sops
    - (if any)
  - README.md

## Usage

- Clone nixos-config into the home folder:
  - `git clone --recurse-submodules https://github.com/KevinFlummi/nixos-config`
  - `git submodule update --init --recursive`
- To pull updates:
  - `git pull --recurse-submodules`
- To push updates of the submodule:
  1. Commit & Push inside of the submodule
  2. run `nix flake update dotfiles`
  3. Commit & Push both modules/config and flake.lock
- For development (i.e. editing nix files and dotfiles), run:
  - `sudo nixos-rebuild switch --flake ~/nixos-config#hostname-in-flake --override-input dotfiles path:/path/to/dotfiles`
  - This is required because dotfiles is configured as a github repository link in the flake for better stability, but we can instead use the local files with the `path:` operator
- For deployment, run:
  - `sudo nixos-rebuild switch --flake ~/nixos-config#hostname-in-flake`

# Open Tasks

- learn tmux
- make modules even more modular:
  - one file for each program in a dir called "instances"
  - in the top-level have modules for components, like "desktop environment" etc (similar to what i have now)
  - the configuration.nix and home.nix files can then either reference "bundles" or direct instances
- figure out how to (partially) use it on macos
