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

  systemd.services.unlock-secondary-drive = {
    description = "Unlock Secondary LUKS Drive";
    wantedBy = [ "multi-user.target" ];
    before = [ "mnt-storage.mount" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = "${pkgs.cryptsetup}/bin/cryptsetup open /dev/disk/by-uuid/b0cf11e3-bfd7-4bfb-9819-287301a1c25e luks-b0cf11e3-bfd7-4bfb-9819-287301a1c25e --key-file /etc/storage.key";
      ExecStop = "${pkgs.cryptsetup}/bin/cryptsetup close luks-b0cf11e3-bfd7-4bfb-9819-287301a1c25e";
    };
  };
  fileSystems."/storage" = {
    device = "/dev/mapper/luks-b0cf11e3-bfd7-4bfb-9819-287301a1c25e";
    fsType = "btrfs";
    options = [
      "defaults"
    ];
  };

  systemd.tmpfiles.rules = [
    "d /storage 0777 root root -"
  ];
}
