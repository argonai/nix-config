{ pkgs, lib, ... }:
{
  programs.neovim = {
    initLua = lib.strings.concatStrings [
      (builtins.readFile ./lua/options.lua)
      (builtins.readFile ./lua/lastplace.lua)
    ];
  };
}
