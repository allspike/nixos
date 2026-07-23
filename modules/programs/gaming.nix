{ pkgs, ... }:

{
  programs.gamemode.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    package = pkgs.steam.override {
      extraEnv = {
        MANGOHUD = "1";
        MANGOHUD_CONFIG = "read_cfg,no_display";
        GAMEMODERUN = "1";
        PROTON_USE_OPTISCALER=1;
        PROTON_FSR_UPGRADE = "1";
        PROTON_ENABLE_WAYLAND = "1";
        DXVK_HDR = "1";
        ENABLE_LAYER_MESA_ANTI_LAG = "1";
      };
    };
  };
}
