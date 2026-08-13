{
  home-manager.users.justins = { pkgs, ... }: {
    home.stateVersion = "26.11";

    home.packages = with pkgs; [
      firefox
      ghostty
      discord
      mpv
      wootility
      heroic
      protonup-qt
      mangohud
      rpcs3
      shadps4-qtlauncher
      gamescope
      dusklight.overrideAttrs
      (oldAttrs: {
        postPatch = (oldAttrs.postPatch or "") + ''
          sed -i '1i#include <cstring>' extern/aurora/lib/card/CardGciFolder.cpp
        '';
      })
      retroarch-full
      fastfetch
      bottles
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

    accounts.email.accounts.personal-email = {
      primary = true;
      address = "justin@spikerman.net";
      realName = "Justin Spikerman";
      thunderbird.enable = true;
    };

    programs.ghostty = {
      enable = true;
      settings = {
        theme = "TokyoNight Night";
        font-family = "JetBrainsMono Nerd font";
        window-width = 100;
        window-height = 50;
      };
    };
  };
}
