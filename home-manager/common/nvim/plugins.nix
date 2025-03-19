{ pkgs, ... }:
{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      # Dependencies
      plenary-nvim

      {
        plugin = nvim-autopairs;
        type = "lua";
        config = (builtins.readFile ./lua/autopairs.lua);
      }

      # Treesitter
      {
        plugin = nvim-treesitter.withAllGrammars;
        type = "lua";
        config = (builtins.readFile ./lua/treesitter.lua);
      }

      {
        plugin = which-key-nvim;
        type = "lua";
        config = (builtins.readFile ./lua/whichkey.lua);
      }

      # Comments
      {
        plugin = comment-nvim;
        type = "lua";
        config = (builtins.readFile ./lua/comment.lua);
      }

      # Performance with big files
      bigfile-nvim
    ];
  };
}
