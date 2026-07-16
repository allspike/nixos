
{ pkgs, ... }:

{
  # Graphics & GPU
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    amdgpu = {
      opencl.enable = true;
      overdrive.enable = true;
    };
  };
  nixpkgs.config.rocmSupport = true;

  # Sound with Pipewire
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Printing
  services.printing.enable = true;

  # System Utilities & Controller rules
  services.scx.enable = true;
  services.lact.enable = true;
  services.udev.packages = with pkgs; [ wooting-udev-rules ];
  services.udev.extraRules = ''
    # PS5 Dualsense Edge controller over USB hidraw
    KERNEL=="hidraw*", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="0ce6", MODE="0660", TAG+="uaccess"

    # PS5 DualSense controller over bluetooth hidraw
    KERNEL=="hidraw*", KERNELS=="*054C:0CE6*", MODE="0660", TAG+="uaccess"
  '';
}
