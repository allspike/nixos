
{ pkgs, ... }:

{
  programs.fish.enable = true;
  users.users.allspike = {
    isNormalUser = true;
    description = "Justin Spikerman";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
  };
}
