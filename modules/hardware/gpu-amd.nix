{
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
}
