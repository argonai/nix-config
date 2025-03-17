{
  config,
  pkgs,
  lib,
  outputs,
  ...
}:
let
  inherit (config.lib.file) mkOutOfStoreSymlink;
in 
{
  programs.neovim.enable = true;
 xdg.configFile = {
   nvim = {
    source = mkOutOfStoreSymlink "${nixConfigDirectory}/home-manager/conf/nvim";
    target = "nvim";
    recursive = true;
    enable = true; 
    };
 };
}
