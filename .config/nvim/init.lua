require('settings')

-- Load in plugins with packer
require('plugins')

require('snippets')

-- Load anything related to the theme (colorschemes, status bar, etc.)
require('theme')

-- Load anything that are tools related (git integrations, etc.)
require('tools')

-- Load keybindings
require('keybindings')

-- Load lsp stuff
require('nvim-cmp')
require('lsp')
--require('lspsaga')
