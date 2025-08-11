{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [
  ./hardware-configuration-medusa.nix
  ];
boot.initrd.kernelModules = ["amdgpu" ];
  

  # Load nvidia driver for Xorg and Wayland
  services.xserver.enable = true;
services.xserver.videoDrivers = [ "amdgpu" ];
systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];
  hardware.graphics.extraPackages = with pkgs; [
  rocmPackages.clr.icd
];
environment.systemPackages = with pkgs; [
  clinfo
];
}
