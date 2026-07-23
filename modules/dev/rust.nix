{ pkgs, ... }:

{
  home-manager.users.justins = { pkgs, ... }: {
    home.packages = with pkgs; [
      rustup
      cargo-binstall
      bacon
      cargo-watch
      pkg-config
    ];

    programs.hjelix.languages = {
      language = [
        {
          name = "rust";
          auto-format = true;
        }
      a;\]
    };
  };
}
