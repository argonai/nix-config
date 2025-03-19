{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraLuaConfig = (builtins.readFile (./lua/keybinds.lua));
    extraPackages = with pkgs; [
      rcp
    ];
  };
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
  imports = [
    ./options.nix
    ./plugins.nix
    ./telescope.nix
    ./lsp.nix
    ./ftplugin.nix
    ./theme.nix
  ];
}
