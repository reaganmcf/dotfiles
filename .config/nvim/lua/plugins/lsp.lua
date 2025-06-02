return {
    {
        'saghen/blink.cmp',
        version = '1.*',
        opts = {
            keymap = { preset = 'enter' },
            appearance = {
                nerd_font_variant = 'mono'
            },
        }
    },
    { 
        "neovim/nvim-lspconfig",
        
        config = function()
            -- Rust
            vim.lsp.enable('rust_analyzer')

            -- Lua
            vim.lsp.enable('lua')

            -- set keybindings
            local opts = { noremap = true, silent = true }
            local map = vim.api.nvim_set_keymap
            map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
            map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
            map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
            map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
            map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
            map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
            map('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
            map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
            map('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float({scope="line"})<CR>', opts)
        end
    }
}
