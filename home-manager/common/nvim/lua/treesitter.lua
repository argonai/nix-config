local configs = require("nvim-treesitter.configs")

configs.setup({
	highlight = {
		enable = true, -- false will disable the whole extension
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true },
})
