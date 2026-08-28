{
  description = "Justin's Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    jovian = {
      url = "github:Jovian-Experiments/Jovian-NixOS";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    {
      nixpkgs,
      home-manager,
      jovian,
      ...
    }:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.justin-nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/justin-nixos
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
          }
          jovian.nixosModules.default
        ];
      };
    };
}
