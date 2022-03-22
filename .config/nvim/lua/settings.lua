local cmd = vim.cmd -- execute vim commands
local o = vim.opt	  -- global/buffer/window scoped options
local g = vim.g		  -- global variables
local exec = vim.api.nvim_exec

-- General settings
g.mapleader = ' '
o.mouse = 'a'
o.clipboard = 'unnamedplus'
o.swapfile = false

-- Relative line numbers
o.relativenumber = true
o.nu = true

-- use sign column and color column for how long lines should be
o.colorcolumn = '0'
o.signcolumn = 'yes'

o.termguicolors = true

-- No need for :noh after searching something
o.hlsearch = false

-- Start scrolling 8 lines from the top or bottom
o.scrolloff = 8

-- Allow buffers to stay alive in the background
o.hidden = true

-- No wrap by default
o.wrap = false
-- Have line wrapping in Markdown files
exec([[
  autocmd FileType markdown setlocal wrap
]], false)

-------------------
-- Tabs and Indents
-------------------
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.smartindent = true

-------------------
-- Startup


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
