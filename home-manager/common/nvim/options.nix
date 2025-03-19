{ pkgs, lib, ... }:
{
  programs.neovim = {
    extraLuaConfig = lib.strings.concatStrings [
      (builtins.readFile ./lua/options.lua)
      (builtins.readFile ./lua/lastplace.lua)
    ];
  };
}
