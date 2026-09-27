{ pkgs, ... }:
{
  home-manager.users.allspike = { pkgs, ... }: {
    imports = [
      ./gaming.nix
    ];
    home.stateVersion = "26.05";

    home.packages = with pkgs; [
      firefox
      discord
      mpv
      wootility
      fastfetch
      bitwarden-desktop
    ];
    programs.helix = {
      defaultEditor = true;
      enable = true;
      settings = {
        theme = "tokyonight";
        editor = {
          line-number = "absolute";
          cursor-shape = {
            normal = "block";
            insert = "bar";
            select = "underline";
          };
        };
      };

      languages = {
        language = [
          {
            name = "nix";
            auto-format = true;
            formatter.command = "nixfmt";
          }

        ];
      };

      extraPackages = [
        pkgs.nixd
        pkgs.nixfmt

      ];
    };

    programs.thunderbird.enable = true;

    programs.foot = {
      enable = true;
    };
  };
}
