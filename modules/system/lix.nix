{ pkgs, ... }:
{
  nixpkgs.overlays = [
    (final: prev: {
      inherit (prev.lixPackagesSets.stable)
        nixpkgs-review
        nix-eval-jobs
        nix-fast-build
        colemna
        ;
    })
  ];

  nix.package = pkgs.lixPackageSets.stable.lix;
}
