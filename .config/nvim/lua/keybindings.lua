local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

----------------------
-- Nvim shortcuts

-- Move around splits with leader and vim keys
map('n', '<leader>h', '<C-w>h', default_opts)
map('n', '<leader>j', '<C-w>j', default_opts)
map('n', '<leader>k', '<C-w>k', default_opts)
map('n', '<leader>l', '<C-w>l', default_opts)

map('n', '<leader><Left>', '<C-w><Left>', default_opts)
map('n', '<leader><Down>', '<C-w><Down>', default_opts)
map('n', '<leader><Up>', '<C-w><Up>', default_opts)
map('n', '<leader><Right>', '<C-w><Right>', default_opts)

map('n', '<leader>v', '<C-w>v', default_opts)
map('n', '<leader>s', '<C-w>s', default_opts)

-- toggle spellcheck
map('n', '<leader>ts', ':setlocal spell! <CR>', default_opts)


---------------------
-- Plugin shortcuts

-- NvimTree
map('n', '<C-n>', ":NvimTreeToggle <CR>", default_opts)
map('n', '<leader>ff', ":NvimTreeFindFileToggle <CR>", default_opts);

-- Jump to tabs
map('n', '<leader>1', ':BufferGoto 1<CR>', default_opts)
map('n', '<leader>2', ':BufferGoto 2<CR>', default_opts)
map('n', '<leader>3', ':BufferGoto 3<CR>', default_opts)
map('n', '<leader>4', ':BufferGoto 4<CR>', default_opts)
map('n', '<leader>5', ':BufferGoto 5<CR>', default_opts)
map('n', '<leader>6', ':BufferGoto 6<CR>', default_opts)
map('n', '<leader>d', ':BufferClose<CR>', default_opts)
map('n', '<leader>p', ':BufferPick<CR>', default_opts)

-- Telescope
map('n', '<C-p>', ':Telescope find_files<CR>', default_opts) -- Ctrl + P to open file finder
map('n', '<C-f>', ':Telescope live_grep<CR>', default_opts)    -- Ctrl + F to open fuzzy search

-- Luasnip
map('n', "<leader><leader>l", "<cmd>source ~/.config/nvim/lua/snippets.lua<CR>", default_opts)
