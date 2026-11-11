{ pkgs, ... }:

{
  home.packages = with pkgs; [
    heroic
    mangohud
    rpcs3
    shadps4-qtlauncher
    gamescope
    dusklight
    retroarch-full
    faugus-launcher
    protonup-qt
  ];
}
