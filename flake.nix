{
  description = "Justin's Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    omarchy-nix = {
      url = "github:henrysipp/omarchy-nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = { nixpkgs, home-manager, omarchy-nix, ... }:
    let
      system = "x86_64-linux";
    in {
      nixosConfigurations.justin-nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/justin-nixos
          home-manager.nixosModules.home-manager
          omarchy-nix.nixosModules.default
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
          }
        ];
      };
    };
}
