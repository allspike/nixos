{ ... }:
{
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
