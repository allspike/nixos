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
    ../../modules/system/power.nix
    ../../modules/system/nh.nix
    ../../modules/system/encrypt.nix
    ../../modules/system/filesystem.nix

    #../../modules/desktop/plasma.nix
    #../../modules/desktop/kde_overlay.nix
    ../../modules/desktop/cosmic.nix
    ../../modules/dev/rust.nix

    ../../modules/hardware/gpu-amd.nix
    ../../modules/hardware/audio.nix
    ../../modules/hardware/printing.nix
    ../../modules/hardware/udev.nix
    ../../modules/hardware/bluetooth.nix

    ../../modules/programs/steam.nix
    ../../modules/home/allspike.nix

    ../../modules/virtualization/qemu.nix
  ];

  system.stateVersion = "26.05";
}
