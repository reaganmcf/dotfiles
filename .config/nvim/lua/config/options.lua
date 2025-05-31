local cmd = vim.cmd
local o = vim.opt
local g= vim.g
local exec = vim.api.nvim_exec

-- General settings
g.mapleader = " "
o.mouse = 'a'
o.clipboard = 'unnamedplus'
o.swapfile = false

-- Relative line numbers
o.colorcolumn = '0'
o.signcolumn = 'yes'

o.termguicolors = true

-- No need for ':noh' after searching
o.hlsearch = false

-- Start scrolling 8 lines from the top or bottom
o.scrolloff = 8

-- Allow bufers to stay alive in the background
o.hidden = true

-- No wrap by default
o.wrap = false
-- but keep it in Markdown files
exec([[
  autocmd FileType markdown setlocal wrap
]], false)

-- Tabs and indents
o.expandtab = true
o.shiftwidth = 4
o.tabstop = 2
o.smartindent = true


-- Disable builtins
local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
    g["loaded_" .. plugin] = 1
end

-- disable nvim intro
o.shortmess:append "sI"
