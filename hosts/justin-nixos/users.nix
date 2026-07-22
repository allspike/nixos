
{ pkgs, ... }:

{
  programs.fish.enable = true;
  users.users.justins = {
    isNormalUser = true;
    description = "Justin Spikerman";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
  };
}
