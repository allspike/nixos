
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    fzf
    nvme-cli
    btop
  ];
}
