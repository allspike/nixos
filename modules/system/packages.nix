{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    fzf
    nvme-cli
    btop

  ];
  services.fwupd.enable = true;

}
