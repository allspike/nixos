{
  description = "Justin's Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Dusklight
    dusklight-flake = import  = {
      url = "github:twilitrealm/dusklight";
    };
  };

  outputs = { self, nixpkgs, dusklight, ... }@inputs: {
    nixosConfigurations = {
      justin-nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          ({ pkgs, ...}: {
            environment.systemPackages = { dusklight.packages.${system} }
          })
        ];
      };
    };
  };
}
