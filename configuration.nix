{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/core.nix
    ./modules/hardware.nix
    ./modules/desktop.nix
    ./modules/gaming.nix
    ./modules/home.nix
  ];

  # Define the core system user
  users.users."justins" = {
    isNormalUser = true;
    description = "Justin Spikerman";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
  };
  system.stateVersion = "26.11";
  
}
