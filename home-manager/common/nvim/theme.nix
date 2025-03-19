{ pkgs, ... }:
{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      # Theme
      kanagawa-nvim
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
      require('kanagawa').setup({
        theme = "wave",
        overrides = function(colors)
          local theme = colors.theme
          return {

          }
        end,
      })
      vim.cmd("colorscheme kanagawa")
    '';
  };
}
