{ pkgs, ... }:

{
  security.tpm2.enable = true;
  imports = [
    ./filesystem.nix
  ];
  boot = {
    plymouth = {
      enable = true;
      theme = "nixos-bgrt";
      themePackages = [ pkgs.nixos-bgrt-plymouth ];
      extraConfig = ''
        [Daemon]
        DeviceScale=1
      '';
    };
    initrd = {
      systemd.enable = true;
      systemd.tpm2.enable = true;
      imports = [
        ./encrypt.nix
      ];
    };

    loader = {
      systemd-boot.enable = false;
      efi.canTouchEfiVariables = true;

      limine = {
        enable = true;
        efiSupport = true;
        efiInstallAsRemovable = true;
        secureBoot.enable = true;
      };
    };
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "quiet"
      "splash"
      "rd.udev.log_level=3"
      "rd.systemd.show_status=auto"
    ];
  };

}
