{ pkgs, ... }:

{
  security.tpm2.enable = true;
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
      systemd.enableTpm2 = true;
      kernelModules = [
        "tpm_tis"
        "tpm_crb"
      ];
      luks.devices."luks-60e53d91-b168-4524-b458-fae12dc78386".device =
        "/dev/disk/by-uuid/60e53d91-b168-4524-b458-fae12dc78386";
    };
    loader = {
      systemd-boot.enable = false;
      efi.canTouchEfiVariables = true;

      limine = {
        enable = true;
        efiSupport = true;
        efiInstallAsRemovable = true;
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
