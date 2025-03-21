vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { noremap = true, silent = true })

require("neo-tree").setup({
  filesystem = {
    filtered_items = {
      always_show = { -- remains visible even if other settings would normally hide it
        ".gitignore",
      },
      always_show_by_pattern = { -- uses glob style patterns
        ".env*",
      },
    },
    window = {
      mappings = {
        ["\\"] = "close_window",
      },
    },
  },
})
