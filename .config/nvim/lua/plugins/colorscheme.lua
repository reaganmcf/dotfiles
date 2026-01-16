return {
    {
        'ellisonleao/gruvbox.nvim',
        priority = 1000,
        config = function()
            require('gruvbox').setup({
                terminal_colors = true,
                -- italic = {
                --    strings = false,
                --    emphasis = false,
                --    comments = true,
                --    operators = false,
                --    folds = false
                -- },
                transparent_mode = true
            })
            vim.cmd([[colorscheme gruvbox]])

            -- fix opacity issues 
            vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
            vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
        end
    }
}
