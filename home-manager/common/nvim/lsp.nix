{
  pkgs,
  lib,
  config,
  ...
}:
{
  programs.neovim = {
    extraPackages = with pkgs; [
      asm-lsp
      nodePackages.bash-language-server
      ccls
      cmake-language-server
      vscode-langservers-extracted
      gopls
      kotlin-language-server
      lemminx
      lexical
      lua-language-server
      omnisharp-roslyn
      phpactor
      pyright
      rust-analyzer
      rubyPackages.solargraph
      sqls
      nodePackages.typescript-language-server
      tinymist
      zls
      zig
      black
      shfmt
      stylua
      nodePackages.prettier
      clang-tools
      nixfmt-rfc-style
      coursier
      metals
      shellcheck
    ];
    plugins = with pkgs.vimPlugins; [
      {
        plugin = none-ls-nvim;
        type = "lua";
        config = (builtins.readFile ./lua/lsp/null-ls.lua);
      }

      # Misc LSP plugins
      nvim-jdtls

      # Debugging
      {
        plugin = nvim-dap;
        type = "lua";
        config = (builtins.readFile ./lua/dap.lua);
      }
      nvim-dap-ui

      # LSP config
      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = lib.strings.concatStrings [
          (builtins.readFile ./lua/lsp/asmlsp.lua)
          (builtins.readFile ./lua/lsp/bash.lua)
          (builtins.readFile ./lua/lsp/ccls.lua)
          (builtins.readFile ./lua/lsp/cmake.lua)
          (builtins.readFile ./lua/lsp/cssls.lua)
          (builtins.readFile ./lua/lsp/gopls.lua)
          (builtins.readFile ./lua/lsp/html.lua)
          (builtins.readFile ./lua/lsp/kotlin.lua)
          (builtins.readFile ./lua/lsp/lemminx.lua)
          (builtins.readFile ./lua/lsp/lexical.lua)
          (builtins.readFile ./lua/lsp/luals.lua)
          (builtins.readFile ./lua/lsp/omnisharp.lua)
          (builtins.readFile ./lua/lsp/phpactor.lua)
          (builtins.readFile ./lua/lsp/pyright.lua)
          (builtins.readFile ./lua/lsp/rust.lua)
          (builtins.readFile ./lua/lsp/scala.lua)
          (builtins.readFile ./lua/lsp/solargraph.lua)
          (builtins.readFile ./lua/lsp/sqlls.lua)
          (builtins.readFile ./lua/lsp/tsserver.lua)
          (builtins.readFile ./lua/lsp/typst.lua)
          (builtins.readFile ./lua/lsp/zig.lua)
        ];
      }

      {
        plugin = blink-cmp;
        type = "lua";
        config = (builtins.readFile ./lua/blink.lua);
      }
      friendly-snippets
    ];
  };
}
