{ config, pkgs, ...}:

{
  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "${lib.getExe pkgs.tuigreet} --time --cmd Hyprland";
      user = "greeter";
    };
  };
}
