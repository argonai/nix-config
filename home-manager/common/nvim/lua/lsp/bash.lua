require("lspconfig").bashls.setup({
	single_file_support = true,
	cmd = { "bash-language-server", "start" },
})
