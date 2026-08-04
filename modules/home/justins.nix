{ pkgs, ... }:

{
  home-manager.users.justins = { pkgs, ... }: {
    home.stateVersion = "26.11";

    home.packages = with pkgs; [
      firefox
      ghostty
      discord
      helix
      mpv
      wootility
      heroic
      protonup-qt
      mangohud
      rpcs3
      shadps4-qtlauncher
      gamescope
      dusklight
      retroarch-full
      fastfetch
      bottles
    ];


    programs.helix = {
      defaultEditor = true;
      enable = true;
      settings = {
        theme = "gruvbox";
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
          {
            name = "rust";
            auto-format = true;
          }
        ];
      };

      extraPackages = [
        pkgs.nixd
        pkgs.nixfmt
        # Rust Tools
        pkgs.rust-analyzer
        pkgs.rustfmt
        pkgs.clippy
      ];
    };

    programs.thunderbird.enable = true;

    accounts.email.accounts.personal-email = {
      primary = true;
      address = "justin@spikerman.net";
      realName = "Justin Spikerman";
      thunderbird.enable = true;
    };
  };
}
