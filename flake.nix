{
  description = "Justin's Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Dusklight
    dusklight.url = "github:twilitrealm/dusklight";
  };

  outputs = { self, nixpkgs, dusklight, ... }@inputs: {
    let
      system = "x86_64-linux";
    in {
      nixosConfigurations = {
        justin-nixos = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./configuration.nix
            ({ pkgs, ... }: {
              environment.systemPackages = [
                dusklight.packages.${system}.default
              ];
            )}
          ];
        };
      };    
  };
}
