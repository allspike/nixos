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
      systemd.tpm2.enable = true;
      kernelModules = [
        "tpm_tis"
        "tpm_crb"
      ];
      luks.devices."luks-60e53d91-b168-4524-b458-fae12dc78386" = {
        device = "/dev/disk/by-uuid/60e53d91-b168-4524-b458-fae12dc78386";
        crypttabExtraOpts = [
          "tpm2-device=auto"
          "tpm2-measure-pcr=yes"
        ];
      };
      luks.devices."luks-b0cf11e3-bfd7-4bfb-9819-287301a1c25e" = {
        device = "/dev/disk/by-uuid/b0cf11e3-bfd7-4bfb-9819-287301a1c25e";
        crypttabExtraOpts = [
          "tpm2-device=auto"
          "tpm2-measure-pcr=yes"
        ];
      };
      luks.devices."luks-48fe6880-b49f-4c45-9ef6-d1d4584578b7" = {
        device = "/dev/disk/by-uuid/48fe6880-b49f-4c45-9ef6-d1d4584578b7";
        crypttabExtraOpts = [
          "tpm2-device=auto"
          "tpm2-measure-pcr=yes"
        ];
      };
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
  fileSystems."/storage" = {
    device = "/dev/mapper/luks-b0cf11e3-bfd7-4bfb-9819-287301a1c25e";
    fsType = "btrfs";
    options = [
      "defaults"
      "nofail"
    ];
  };

  systemd.tmpfiles.rules = [
    "d /storage 0777 root root -"
  ];

}
