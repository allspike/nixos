{ pkgs, ... }:
{
  services = {
    displayManager.plasma-login-manager.enable = true;
    desktopManager.plasma6.enable = true;
    xserver.enable = false;
  };
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    konsole
  ];
}
