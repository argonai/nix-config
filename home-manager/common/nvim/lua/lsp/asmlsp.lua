require("lspconfig").asm_lsp.setup({
	single_file_support = true,
	cmd = { "asm-lsp" },
	-- offset_encoding = "utf-16",
	filetypes = { "asm", "vmasm" },
})
