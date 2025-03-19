-- Keybinds that are NOT handled by whichkey

-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Switch between splits with control+hjkl
keymap("n", "<C-k>", ":wincmd k<CR>", opts)
keymap("n", "<C-j>", ":wincmd j<CR>", opts)
keymap("n", "<C-h>", ":wincmd h<CR>", opts)
keymap("n", "<C-l>", ":wincmd l<CR>", opts)

-- Control+Tab to switch buffer tabs
keymap("n", "<C-Tab>", "<cmd>BufferLineCycleNext<cr>", opts)
keymap("n", "<C-S-Tab>", "<cmd>BufferLineCyclePrev<cr>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Insert --
keymap("i", "<C-BS>", "<C-W>", opts)
