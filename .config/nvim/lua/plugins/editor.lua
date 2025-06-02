return {
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    },
    {
        'ibhagwan/fzf-lua',
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            -- set keymap
            local map = vim.api.nvim_set_keymap
            local default_opts = { noremap = true, silent = true }

            map('n', '<C-p>', ':FzfLua files<CR>', default_opts) -- Ctrl + P to open file finder
            map('n', '<C-f>', ':FzfLua grep_project<CR>', default_opts)    -- Ctrl + F to open fuzzy search
        end
    },
    {
        'folke/zen-mode.nvim',
        opts = {}
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {}
    },
    {
        "alexghergh/nvim-tmux-navigation",
        config = function()
            local nvim_tmux_nav = require('nvim-tmux-navigation')
            
            nvim_tmux_nav.setup {
                disable_when_zoomed = false
            }

            vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
            vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
            vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
            vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
        end
    }
}
