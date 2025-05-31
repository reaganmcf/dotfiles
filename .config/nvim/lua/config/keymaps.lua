local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

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
