local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

-- https://github.com/prettier-solidity/prettier-plugin-solidity
null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({
			extra_filetypes = { "toml" },
		}),
		formatting.black.with({
			extra_args = { "--fast" },
		}),
		formatting.nixfmt.with({}),
		formatting.pint.with({}),
		formatting.shfmt.with({}),
		formatting.stylua.with({}),
	},
})
