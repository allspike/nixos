
{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./users.nix

    ../../modules/system/boot.nix
    ../../modules/system/networking.nix
    ../../modules/system/locale.nix
    ../../modules/system/nix.nix
    ../../modules/system/packages.nix

    ../../modules/desktop/plasma.nix

    ../../modules/hardware/gpu-amd.nix
    ../../modules/hardware/audio.nix
    ../../modules/hardware/printing.nix
    ../../modules/hardware/udev.nix

    ../../modules/programs/gaming.nix
    ../../modules/home/justins.nix

    ../../modules/virtualization/qemu.nix
  ];

  system.stateVersion = "26.11";
}
