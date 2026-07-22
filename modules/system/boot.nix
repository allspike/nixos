
{ pkgs, ... }:

{
  boot = {
    plymouth = {
      enable = true;
      theme = "nixos-bgrt";
      themePackages = [ pkgs.nixos-bgrt-plymouth ];
      extraConfig = ''
        [Daemon]
        DeviceScale=an-integer-scaling-factor
      '';
    };

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 0;
    };

    kernelPackages = pkgs.linuxPackages_zen;
    kernelParams = [
      "quiet"
      "splash"
      "rd.systemd.show_status=auto"
      "rd.udev.log_level=3"
    ];
  };
}
