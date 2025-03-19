local gitsigns = require("gitsigns")

gitsigns.setup({
	signs = {
		add = { text = "▎" },
		change = { text = "▎" },
		delete = { text = "󱨊" },
		topdelete = { text = "󱨉" },
		changedelete = { text = "▎" },
	},
	signcolumn = true,
	numhl = false,
	linehl = false,
	word_diff = false,
})
