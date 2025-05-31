return {
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("nvim-tree").setup({
                sort = {
                    sorter = "case_sensitive"
                },
                view = {
                    width = 30
                },
                renderer = {
                    group_empty = true
                },
                filters = {
                    dotfiles = false
                }
            })

            -- Add relevant keybindings 
            local map = vim.api.nvim_set_keymap
            local default_opts = { noremap = true, silent = true }
            map('n', '<C-n>', ":NvimTreeToggle <CR>", default_opts)
            map('n', '<C-F>', ":NvimTreeFindFileToggle <CR>", default_opts);
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require('lualine').setup()
        end
    },
    {
        "b0o/incline.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = 'VeryLazy',
        config = function()
            local devicons = require 'nvim-web-devicons'
            require('incline').setup {
              render = function(props)
                local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
                if filename == '' then
                  filename = '[No Name]'
                end
                local ft_icon, ft_color = devicons.get_icon_color(filename)

                local function get_git_diff()
                  local icons = { removed = '', changed = '', added = '' }
                  local signs = vim.b[props.buf].gitsigns_status_dict
                  local labels = {}
                  if signs == nil then
                    return labels
                  end
                  for name, icon in pairs(icons) do
                    if tonumber(signs[name]) and signs[name] > 0 then
                      table.insert(labels, { icon .. signs[name] .. ' ', group = 'Diff' .. name })
                    end
                  end
                  if #labels > 0 then
                    table.insert(labels, { '' })
                  end
                  return labels
                end

                local function get_diagnostic_label()
                  local icons = { error = '', warn = '', info = '', hint = '' }
                  local label = {}

                  for severity, icon in pairs(icons) do
                    local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
                    if n > 0 then
                      table.insert(label, { icon .. n .. ' ', group = 'DiagnosticSign' .. severity })
                    end
                  end
                  if #label > 0 then
                    table.insert(label, { '┊ ' })
                  end
                  return label
                end

                return {
                  { get_diagnostic_label() },
                  { get_git_diff() },
                  { (ft_icon or '') .. ' ', guifg = ft_color, guibg = 'none' },
                  { filename .. ' ', gui = vim.bo[props.buf].modified and 'bold,italic' or 'bold' },
                  { '┊  ' .. vim.api.nvim_win_get_number(props.win), group = 'DevIconWindows' },
                }
              end,
            }
            --local helpers = require 'incline.helpers'
            --local devicons = require 'nvim-web-devicons'

            --require('incline').setup({
            --    window = {
            --        padding = 0,
            --        margin = { horizontal = 0 }
            --    },
            --    render = function(props)
            --        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
            --        if filename == '' then
            --            filename = '[No Name]'
            --        end
            --        local ft_icon, ft_color = devicons.get_icon_color(filename)
            --        local modified = vim.bo[props.buf].modified
            --        return {
            --            ft_icon and { ' ', ft_icon, ' ', guibg = ft_color, guifg = helpers.contrast_color(ft_color) or '' },
            --            ' ',
            --            { filename, gui = modified and 'bold,italic' or 'bold' },
            --            ' ',
            --            guibg = '#44406e'
            --        }
            --    end
            --})
        end
    }
}
