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
" Pyton autocomplete
"Plug 'deoplete-plugins/deoplete-jedi'

" Nerd tree and nerd tree syntax highlighting
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Vim Icons
Plug 'ryanoasis/vim-devicons'

" One Dark Theme
Plug 'joshdick/onedark.vim'

" Fuzzy Finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

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

call plug#end()
"===========
"END PLUGINS
"===========

"==================
"BEGIN KEY BINDINGS
"==================
" bind Ctrl + / to open nerd tree
nnoremap <C-_> :NERDTreeToggle<CR>

" bind Ctrl + P to open fzf
nnoremap <C-p> :GFiles<CR>

"==================
"END KEY BINDINGS
"==================

" set term colors to 256
set t_Co=256

" use relative line numbers
set relativenumber

" set colorscheme
colorscheme gruvbox

" rustfmt autosave fail silently
let g:rustfmt_fail_silently = 1

" disable help
:nmap <F1> <nop>

" use mouse
set mouse=a

" Airline Configurations
let g:airline_theme='monochrome'
let g:airline_section_y=''
let g:airline_section_x=''
"let g:airline_section_z=''

" start deoplete
let g:deoplete#enable_at_startup = 1

" onedark settings
"let g:onedark_hide_endofbuffer = 1
"let g:onedark_termcolors = 256
"let g:onedark_terminal_italics = 1

" disable vimfiler on welcome screen
let g:spacevim_enable_vimfiler_welcome = 0

" set background transparent
hi Normal ctermbg=NONE

" set syntax on by default
"filetype plugin on
"syntax on

set guifont=FiraMono\ Nerd\ Font\ Mono:16

" use double width devicons glpys
let g:WebDevIconsUnicodeGlyphDoubleWidth = 2

""" Start NERDTree and put the cursor back in the other window
"autocmd VimEnter * NERDTree | wincmd p

""" IDE custom command
"""   - opens NERDTRee on the left, terminal on the bottom
command IDE :NERDTree | wincmd l | :vsp | wincmd l | :ter

""" Dark / Light Mode
"command Light :colorscheme NeoSolarized | :set background=light | :AirlineTheme solarized
"command Dark :colorscheme onedark | :set background=dark | :AirlineTheme onedark

""" clipboard
set clipboard=unnamedplus

" use firefox-developer-edition for markdown preview
let g:mkdp_browser = 'firefox-developer-edition'

" Disable Arrow keys in Normal mode
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>

" Disable Arrow keys in Insert mode
"imap <up> <nop>
"imap <down> <nop>
"imap <left> <nop>
""/imap <right> <nop>
