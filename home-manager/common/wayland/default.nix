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
    ./fonts.nix
    ./niri.nix
  ];
}
