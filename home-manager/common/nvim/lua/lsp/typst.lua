require("lspconfig").tinymist.setup({
	settings = { exportPdf = "onSave" },
})
-- Disable SQL stuff
vim.g.omni_sql_no_default_maps = 1
