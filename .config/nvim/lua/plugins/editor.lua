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
        opts = {}
    },
    {
        'folke/zen-mode.nvim',
        opts = {}
    }
}
