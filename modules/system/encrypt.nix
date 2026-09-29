{
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
}
