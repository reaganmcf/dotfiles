local exec = vim.api.nvim_exec

-- Gitsigns
require('gitsigns').setup()

-- Sidebar.nvim
--require('sidebar-nvim').setup({
--  disable_default_keybindings = 0,
--  bindings = nil,
--  open = false,
--  side = "left",
--  initial_width = 35,
--  hide_statusline = false,
--  update_interval = 1000,
--  sections = { "files", "datetime", "git", "diagnostics" },
--  section_separator = "-----",
--  containers = {
--      attach_shell = "/bin/sh", show_all = true, interval = 5000,
--  },
--  datetime = { format = "%a %b %d, %H:%M", clocks = { { name = "local" } } },
--  todos = { ignored_paths = { "~" } },
--  disable_closing_prompt = false
--})

-- Auto format on save for prettier
--exec([[ let g:prettier#autoformat = 1 ]], false)
--exec([[ let g:prettier#autoformat_require_pragma = 0 ]], false)

-- Highlight on yank
exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
  augroup end
]], false)

-- Auto save on exiting insert mode
--exec([[
--  autocmd InsertLeave * write
--]], false)
