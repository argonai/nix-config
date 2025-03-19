# This file is licenced under GPL-3.0

{ pkgs, ... }:
{
  programs.neovim = {
    extraPackages = with pkgs; [
      ripgrep
      fd
    ];
    plugins = with pkgs.vimPlugins; [
      {
        plugin = telescope-nvim;
        type = "lua";
        config = (builtins.readFile ./lua/telescope.lua);
      }
    ];
  };
}
