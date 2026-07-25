
{ pkgs, ... }:

{
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

    loader = {
      systemd-boot.enable = false;
      efi.canTouchEfiVariables = true;

      limine = {
        enable = true;
        efiSupport = true;
        efiInstallAsRemovable = true;
      };
    };
    kernelPackages = pkgs.linuxPackages_zen;
  };
}
