{ pkgs, ... }:
{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      # Theme
      material-nvim
      {
        plugin = lualine-nvim;
        type = "lua";
        config = (builtins.readFile ./lua/lualine.lua);
      }
      nvim-web-devicons
      mini-nvim
      {
        plugin = bufferline-nvim;
        type = "lua";
        config = (builtins.readFile ./lua/bufferline.lua);
      }
      {
        plugin = gitsigns-nvim;
        type = "lua";
        config = (builtins.readFile ./lua/gitsigns.lua);
      }
      {
        plugin = indent-blankline-nvim;
        type = "lua";
        config = ''
          require("ibl").setup{
            indent = { char = "·" }
          }
        '';
      }
    ];

    extraLuaConfig = ''
      require('material').setup({
        disable = {
          background = true, 
        },
      })
      vim.cmd("colorscheme material")
    '';
  };
}
