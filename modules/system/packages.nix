{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    fzf
    nvme-cli
    btop
    sbctl

  ];
  services.fwupd.enable = true;

}
