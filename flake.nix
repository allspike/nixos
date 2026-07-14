{
  description = "Justin's Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Dusklight configuration with explicit submodule cloning enabled
    dusklight = {
      url = "git+https://github.com/TwilitRealm/dusklight?submodules=1";
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
                (dusklight.packages.${system}.default.overrideAttrs (oldAttrs: {
                  
                  # 1. Inject miniz from Nixpkgs into the build dependencies
                  nativeBuildInputs = (oldAttrs.nativeBuildInputs or []) ++ [ pkgs.miniz ];
                  buildInputs = (oldAttrs.buildInputs or []) ++ [ pkgs.miniz ];

                  # 2. Tell CMake to stop trying to pull things down online
                  cmakeFlags = (oldAttrs.cmakeFlags or []) ++ [
                    "-DFETCHCONTENT_FULLY_DISCONNECTED=ON"
                  ];

                  # 3. If CMake strictly relies on specific local paths, we can link them
                  preConfigure = ''
                    mkdir -p build/_deps
                    ln -s ${pkgs.miniz.src} build/_deps/miniz-src
                  '' + (oldAttrs.preConfigure or "");
                }))
              ];
            })
          ];
        };
      };
    };
}
