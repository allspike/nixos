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
    ];

    programs.fish.enable = true;

    programs.helix = {
      enable = true;
      settings.theme = "autumn_night";
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
