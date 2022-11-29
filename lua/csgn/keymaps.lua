local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Custom
keymap("i", "<C-e>", "<C-o>A", opts)

-- Clipboard
keymap("n", "<leader>c", ":set clipboard=unnamedplus<CR>", opts)
keymap("n", "<leader>C", ":set clipboard=<CR>", opts)

-- Telescope
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({  }))<cr>", opts)
keymap("n", "<leader>t", "<cmd>Telescope live_grep<cr>", opts)

-- HOP
local hop = require('hop')
local directions = require('hop.hint').HintDirection

vim.keymap.set('', '<leader><leader>', function()
  hop.hint_words({ })
end)

vim.keymap.set('', '<leader>a', function()
  hop.hint_anywhere({ })
end)

vim.keymap.set('', '<leader>p', function()
  hop.hint_patterns({ })
end)

vim.keymap.set('', 'f', function()
  hop.hint_anywhere({ direction = directions.AFTER_CURSOR, current_line_only = true })
end)

vim.keymap.set('', 'F', function()
  hop.hint_anywhere({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end)


-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
--keymap("n", "<leader>t", ":NvimTreeFocus<cr>", opts)


-- Navigate buffers
keymap("n", "<S-l>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<S-h>", ":BufferLineCyclePrev<CR>", opts)
