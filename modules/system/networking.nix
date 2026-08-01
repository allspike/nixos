
{
  services.tailscale = {
    enable = true;
  };
  networking = {
    hostName = "justin-nixos";
    networkmanager.enable = true;
    nftables.enable = true;
    firewall = {
      true;
      trustedInterfaces = [ config.services.tailscale.interfaceName ];
      allowedUDPPorts = [ config.services.tailscale.port ];
    };
  };

  systemd.services.tailscaled.serviceConfig.Environment = [
    "TS_DEBUG_FIREWALL_MODE=nftables"
  ];

  systemd.network.wait-online.enable = false;
  boot.initrd.systemd.network.wait-online.enable = false;
}
