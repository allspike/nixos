{ pkgs, ... }:

{
  services = {
    displayManager.cosmic-greeter.enable = true;
    desktopManager.cosmic.enable = true;
    displayManager.autoLogin = {
      enable = true;
      user = "justins";
    };
    system76-scheduler.enable = true;
  };

  programs.firefox.preferences = {
    #disable libadwaita theming for Firefox
    "widget.gtk.libadwaita-colors.enable" = false;
  };
}
