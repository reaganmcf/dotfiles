return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- File explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    config = function() require'nvim-tree'.setup {} end
  }

  -- Better status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Markdown preview
  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && yarn install',
  }

  -- Gitsigns
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

  -- THEME: nightfox
  use 'EdenEast/nightfox.nvim'

  -- THEME: ayu
  use 'Shatur/neovim-ayu'

  -- Treesitter
  use 'nvim-treesitter/nvim-treesitter'

  -- LSP
  use 'neovim/nvim-lspconfig'

  -- autocomplete
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',
    },
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 
      {'nvim-lua/plenary.nvim'} 
    }
  }

  -- Startup screen
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.opts)
    end
  }

  -- kitty syntax highlighting
  use 'fladson/vim-kitty'
  
  -- Fish syntax highlighting
  use 'dag/vim-fish'

  -- TOML syntax highlighting
  use 'cespare/vim-toml'

  -- Tabs
  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  -- Sidebar
  use 'sidebar-nvim/sidebar.nvim'
  
  -- Prettier
  use 'prettier/vim-prettier'

  -- Nvim R
  use {
    'jalvesaq/Nvim-R',
    branch = 'stable'
  }
  
  -- Scratch pad
  use 'mtth/scratch.vim'
  
  -- Roth syntax highlighting
  use '~/Code/roth/editor/roth.vim'

  -- Luasnip
  use 'L3MON4D3/LuaSnip'
  
  -- gruvbox
  use 'ellisonleao/gruvbox.nvim'
  
  -- lspsaga
  use 'glepnir/lspsaga.nvim'

  -- Presenting.vim
  use 'sotte/presenting.vim'

end)
