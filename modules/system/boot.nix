
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
        extraConfig = ''
          remember_last_entry: yes
          '';
      };
      timeout = 0;

    };

    kernelPackages = pkgs.linuxPackages_zen;
  };
}
