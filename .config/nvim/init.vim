"=============================================================================
" init.vim --- Entry file for neovim
" Copyright (c) 2016-2020 Wang Shidong & Contributors
" Author: Wang Shidong < wsdjeg@outlook.com >
" URL: https://spacevim.org
" License: GPLv3
"=============================================================================

"execute 'source' fnamemodify(expand('<sfile>'), ':h').'/main.vim'

"=============
"BEGIN PLUGINS
"=============
call plug#begin('~/.config/nvim/plugged')
" Pyton formatting
Plug 'Vimjas/vim-python-pep8-indent'

" Nerd tree and nerd tree syntax highlighting
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Vim Icons
Plug 'ryanoasis/vim-devicons'

" One Dark Theme
Plug 'joshdick/onedark.vim'

" Fuzzy Finder
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" GitGutter
Plug 'airblade/vim-gitgutter'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Lens and Animate
Plug 'camspiers/animate.vim'
Plug 'camspiers/lens.vim'

" Java Syntax Highlighting
Plug 'uiiaoo/java-syntax.vim'

" React syntax highlighting
Plug 'maxmellon/vim-jsx-pretty'

" auto indent
Plug 'tpope/vim-sleuth'

" markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" rust format
Plug 'alx741/vim-rustfmt'

" fish syntax highlighting
Plug 'dag/vim-fish'

" gruvbox
Plug 'morhetz/gruvbox'

" smooth scrolling
Plug 'psliwka/vim-smoothie'

" buftabline
Plug 'ap/vim-buftabline'

" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" es6 syntax
Plug 'isRuslan/vim-es6'

" css color
Plug 'ap/vim-css-color'

call plug#end()
"===========
"END PLUGINS
"===========

" set colorscheme
colorscheme gruvbox

"==================
"BEGIN KEY BINDINGS
"==================
" bind Ctrl + / to open nerd tree
nnoremap <C-_> :NERDTreeToggle<CR>

" bind Ctrl + P to open telescope
nnoremap <C-p> :Telescope find_files<CR>

" disable help
:nmap <F1> <nop>

"==================
"END KEY BINDINGS
"==================

"==================
"START SET
"==================
" set term colors to 256
set t_Co=256

" use relative line numbers
set relativenumber
set nu

" no need for :noh after searching something
set nohlsearch

" Allow buffers to stay alive in background (you can switch between buffers
" without saving)
set hidden

" No line wrapping
set nowrap

" smart case searching
set ignorecase
set smartcase

" No backups and no temp files
set noswapfile
set nobackup

" Keep undo history
set undodir="~/.vim/undodir"
set undofile

" Scroll offset - start scrolling when you're near the top or bottom
set scrolloff=8

" Use a sign column, and the color column to use as a reference for how long
" lines should be
set colorcolumn=100
set signcolumn=yes

" use mouse
set mouse=a

" clipboard
set clipboard=unnamedplus

" set background transparent
hi Normal ctermbg=NONE

" Set GUI Font
set guifont=FiraMono\ Nerd\ Font\ Mono:16

""" use 2 spaces as tab by default
filetype indent on
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

"=================
"END SETS
"=================

" rustfmt autosave fail silently
let g:rustfmt_fail_silently = 1

" Airline Configurations
let g:airline_theme='monochrome'
let g:airline_section_y=''
let g:airline_section_x=''
"let g:airline_section_z=''

" onedark settings
"let g:onedark_hide_endofbuffer = 1
"let g:onedark_termcolors = 256
"let g:onedark_terminal_italics = 1

" disable vimfiler on welcome screen
let g:spacevim_enable_vimfiler_welcome = 0

" use double width devicons glpys
let g:WebDevIconsUnicodeGlyphDoubleWidth = 2

""" Start NERDTree and put the cursor back in the other window
"autocmd VimEnter * NERDTree | wincmd p

""" Dark / Light Mode
"command Light :colorscheme NeoSolarized | :set background=light | :AirlineTheme solarized
"command Dark :colorscheme onedark | :set background=dark | :AirlineTheme onedark


""" TELESCOPE CONFIG
lua << EOF
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_position = "bottom",
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_defaults = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {'.git/', 'node_modules/'},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}
EOF
