return {
  {
    'folke/zen-mode.nvim',
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      vim.keymap.set('n', '<leader>tz', ':ZenMode', { desc = '[T]oggle [Z]en mode' }),
    },
  },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = true,
    vim.keymap.set('n', '<leader>tt', ':ToggleTerm', { desc = '[T]oggle [T]erm' }),
  },
  {
    'norcalli/nvim-colorizer.lua',
  },
  {
    'rcarriga/nvim-notify',
  },
}
