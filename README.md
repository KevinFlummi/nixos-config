# tldr Main App List

- WM: Wayland / Niri
- Desktop Shell: Noctalia
- Terminal: Kitty
- Shell: Zsh
- Editor: NVim
- FileMan: Thunar
- Colors: Catpucchin
- Fonts: Nerd-Fonts Jetbrains & Inter

# Repo Organization

## Repo for nixos configuration

- nixos-config/
  - flake.nix % high-level wiring and control point
  - flake.lock
  - hosts/ % one folder for each machine, load modules depending on needs & purpose
    - pc/
      - hardware-configuration.nix
      - configuration.nix
  - modules/
    - nixos/ % core OS programs and utils
      - audio.nix
      - boot.nix
      - cmdutils.nix
      - connectivity.nix
      - fonts.nix
      - gaming.nix
      - graphics.nix
      - locale.nix
      - login.nix
      - system.nix
      - users.nix
      - wayland.nix
    - home/ % specific apps for certain task groups
      - browser.nix
      - common.nix
      - desktop.nix
      - editor.nix
      - gaming.nix
      - media.nix
      - socials.nix
      - terminal.nix
      - research.nix
    - dotfiles % submodule of my dotfiles for all necessary xdg configuration
  - home/
    - kevin/ % one folder for each user instance, in here we import modules based on user prefs
      - home.nix
  - secrets/
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

- get latex setup in nvim to work (+ move latex pkgs from research to editor)
- nextcloud integration (nextcloud-client or as network mount?)
- organize colorscheme in separate module
- figure out how to (partially) use it on macos
- noctalia screenrecorder plugin: add widget for the -r tag (shadowplay-esque)
- keyboard layout mine setup (+ repair linear kbd l key) (+ print heavier case)
- niri set up named workspaces: work, fun, aux, bg
- learn about tmux
- reorganize everything (tbd: find out how it makes sense)
