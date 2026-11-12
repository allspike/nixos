{ pkgs, ... }:

{
  home-manager.users.allspike = { pkgs, ... }: {
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
