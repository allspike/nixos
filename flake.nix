{
  description = "Justin's Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Dusklight configuration with explicit submodule cloning enabled
    dusklight = {
      url = "git+https://github.com/TwilitRealm/dusklight?ref=main";
      submodules = true;
    };
  };

  outputs = { self, nixpkgs, dusklight, ... }@inputs: 
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
            })
          ];
        };
      };
    };
}
