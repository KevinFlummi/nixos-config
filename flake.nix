{
  description = "NixOS Base Setup";
  inputs = {
    dotfiles = {
      url = "github:KevinFlummi/dotfiles";
      flake = false;
    };
    nixpkgs.url = "nixpkgs/nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    dotfiles,
    home-manager,
    catppuccin,
    noctalia,
    ...
  }: {
    nixosConfigurations.pc = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/pc/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {
              inherit dotfiles;
            };
            users.kevin.imports = [
              ./home/kevin.nix
              catppuccin.homeModules.catppuccin
              noctalia.homeModules.default
            ];
            backupFileExtension = "backup";
          };
        }
      ];
    };
  };
}
