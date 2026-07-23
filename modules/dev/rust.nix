{ pkgs, ... }:

{
  home.mnanager.users.justins = { pkgs, ... }: {
    home.packages = with pkgs; [
      rustup
      cargo-bininstall
      bacon
      cargo-watch
      pkg-config
    ];
  };
}
