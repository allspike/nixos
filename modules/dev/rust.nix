{ pkgs, ... }:

{
  home-manager.users.allspike = { pkgs, ... }: {
    home.packages = with pkgs; [
      rustup
      cargo-binstall
      bacon
      cargo-watch
      pkg-config
      
    ];

    programs.helix.languages = {
      language = [
        {
          name = "rust";
          auto-format = true;
        }
      ];
    };
  };
}
