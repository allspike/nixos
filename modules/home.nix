{ pkgs, ... }:

{
  # System level shell hook to ensure fish is enabled
  #programs.fish.enable = true;

  home-manager.users."justins" = { pkgs, ... }: {
    home.stateVersion = "26.11";

    # User-specific packages
    home.packages = with pkgs; [
      # User apps
      firefox
      ghostty
      discord

      # Dev & CLI tools
      helix
      mpv

      # Hardware utilities
      wootility

      # Gaming / Emulation additions
      heroic
      protonup-qt
      mangohud
      rpcs3
      shadps4-qtlauncher
      gamescope
      dusklight
      retroarch-full
    ];

    # Shell configurations inside Home Manager
    programs.fish = {
      enable = true;
      #interactiveShellInit = ''
        # Custom user fish configurations can go here
      #'';
    };

    # Helix default configs can be managed here too
    programs.helix = {
      enable = true;
      settings = {
        theme = "autumn_night";
      };
    };
    programs.thunderbird = {
      enable = true;
      
    };

    accounts.email.accounts = {
      "personal-email" = {
        address = "justin@spikerman.net";
        realName = "Justin Spikerman";
        thunderbird.enable = true;
        
      };
    };
  };
}
