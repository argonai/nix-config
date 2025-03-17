{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./common.nix
    ./theme.nix
    ./waybar.nix
    ./niri.nix
  ];
}
