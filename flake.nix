{
  description = "Justin's Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable"; # needed for cachyos kernel
  };

  outputs = { self, nixpkgs }@inputs: {
    nixosConfigurations = {
      justin-nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          chaotic.nixosModules.default # add chaotic nix as a module
        ];
      };
    };
  };
}
