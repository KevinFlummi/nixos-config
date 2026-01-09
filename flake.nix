{
  description = "NixOS Base Setup";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #quickshell = {
    #  url = "github:outfoxxed/quickshell";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, catppuccin, noctalia, ... }: {
    nixosConfigurations.pc = nixpkgs.lib.nixosSystem {
      system  = "x86_64-linux";
      modules = [
        ./hosts/pc/configuration.nix
        home-manager.nixosModules.home-manager
	      {
	         home-manager = {
             useGlobalPkgs = true;
             useUserPackages = true;
             users.kevin.imports = [
               ./home/kevin/home.nix
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
