{ pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
  };

  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "${lib.get Exe pkgs.tuigreet} --time --cmd Hyprland";
      user = "greeter";
    };
  };

  services.displaymanager.defaultSession = "hyprland";

  environment.systemPackages = with pkgs; [
    tuigreet
    wayland
    wl-clipboard
    grim
    slurp
    brightnessctl
    pavucontrol
    networkmanagerapplet
    playerctl
  ];

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk;
    ];
  };
  security.polkit.enable = true;
}
