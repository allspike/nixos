{ pkgs, lib, ... }:

{
  programs.hyprland = {
    enable = true;
  };

  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "${lib.getExe pkgs.tuigreet} --time --cmd Hyprland";
      user = "greeter";
    };
  };


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
      xdg-desktop-portal-gtk
    ];
  };
  security.polkit.enable = true;
}
