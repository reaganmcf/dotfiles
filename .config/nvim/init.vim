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
" Python formatting
Plug 'Vimjas/vim-python-pep8-indent'

" Nerd tree and nerd tree syntax highlighting
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" cursor fix for nvim
Plug 'antoinemadec/FixCursorHold.nvim'

" Vim Icons
Plug 'ryanoasis/vim-devicons'

" One Dark Theme
Plug 'joshdick/onedark.vim'

" Fuzzy Finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Semantic language support
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" GitGutter
Plug 'airblade/vim-gitgutter'

" Highlighted yank
Plug 'machakann/vim-highlightedyank'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Java Syntax Highlighting
Plug 'uiiaoo/java-syntax.vim'

" Haskell syntax highlighting
Plug 'neovimhaskell/haskell-vim'

" React syntax highlighting
Plug 'maxmellon/vim-jsx-pretty'

" auto indent
Plug 'tpope/vim-sleuth'

" markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" rust format
Plug 'rust-lang/rust.vim'

" fish syntax highlighting
Plug 'dag/vim-fish'

" gruvbox
Plug 'morhetz/gruvbox'

" smooth scrolling
Plug 'psliwka/vim-smoothie'

" buftabline
" Plug 'ap/vim-buftabline'

" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" es6 syntax
Plug 'isRuslan/vim-es6'

" css color
Plug 'ap/vim-css-color'

" ripgrep
"Plug 'jremmen/vim-ripgrep'

" vim beautify
Plug 'maksimr/vim-jsbeautify'

" toml syntax highlighting
Plug 'cespare/vim-toml'

" custom nakala syntax highlighting
Plug 'nakala-lang/nakala.vim'

" MDX syntax highlighting
Plug 'jxnblk/vim-mdx-js'

" Prettier
Plug 'prettier/vim-prettier'

" harpoon
Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon'

" google codefmt
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

call plug#end()
call glaive#Install()
"===========
"END PLUGINS
"===========

if has('nvim')
    set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
    set inccommand=nosplit
    noremap <C-q> :confirm qall<CR>
end

" color things
set t_Co=256
set background=dark
set termguicolors
"let base16colorspace=256
"let g:base16_shell_path="~/.config/base16-shell/scripts/"
hi Normal ctermbg=NONE
colorscheme gruvbox
" Brighter comments
" call Base16hi("Comment", g:base16_gui09, "", g:base16_cterm09, "", "", "")

"==================
"BEGIN KEY BINDINGS
"==================
" bind Ctrl + / to open nerd tree
nnoremap <C-_> :NERDTreeToggle<CR>

" bind Ctrl + P to open telescope
nnoremap <C-p> :Files<CR>

" disable help
:nmap <F1> <nop>

"==================
"END KEY BINDINGS
"==================

"==================
"START SET
"==================
" spellcheck
set spell
set spelllang=en_us

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

" Better completion
" menuone: popup even when there's only one match
" noinsert: do not insert text until a selection is made
" noselect: do not select, force user to select one from the menu
set completeopt=noinsert,menuone,noselect
" Better display for messages
set cmdheight=2
" Use faster update time
set updatetime=300

" Don't pass messages to |ins-complete-menu|
set shortmess+=c

" Set GUI Font
set guifont=FiraMono\ Nerd\ Font\ Mono:16

""" use 2 spaces as tab by default
syntax on
filetype plugin indent on
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

"=================
"END SETS
"=================

"============================
"START LEADER CUSTOM SORTCUTS
"============================
let mapleader = " "

" fast window switching
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>v :wincmd v<CR>
nnoremap <leader>s :wincmd s<CR>

" Open nerd tree to the left
nnoremap <leader>pv :NERDTree <bar> :wincmd h<bar> :vertical resize 30<CR>

" fzf for buffers
nnoremap <leader>b :ls<CR>:b<Space>

" fast buffer switching
nnoremap <leader>1 :b 1<CR>
nnoremap <leader>2 :b 2<CR>
nnoremap <leader>3 :b 3<CR>
nnoremap <leader>4 :b 4<CR>
nnoremap <leader>5 :b 5<CR>
nnoremap <leader>6 :b 6<CR>

" close buffer
nnoremap <leader>d :bd<CR>

" disable coc
let g:coc_start_at_startup = v:false


"==========================
"END LEADER CUSTOM SORTCUTS
"==========================

"==========================
"START PLUGIN CONFIGURATION
"==========================

" highlight duration to 150ms
let g:highlightedyank_highlight_duration = 150

" Use <Tab> and <S-Tab> to navigate through popup menu
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" use <Tab> as trigger keys
" imap <Tab> <Plug>(completion_smart_tab)
" imap <S-Tab> <Plug>(completion_smart_s_tab)

" Enable type inlay hints
autocmd CursorHold,CursorHoldI *.rs :lua require'lsp_extensions'.inlay_hints{ only_current_line = true }

" Airline Configurations
let g:airline_theme='base16'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_nr_show = 1
" let g:airline_section_y=''
" let g:airline_section_x=''
" let g:airline_section_z=''

" rustfmt format on save
let g:rustfmt_autosave = 1

" onedark settings
"let g:onedark_hide_endofbuffer = 1
"let g:onedark_termcolors = 256
"let g:onedark_terminal_italics = 1

" use double width devicons glpys
let g:WebDevIconsUnicodeGlyphDoubleWidth = 2

" enable prettier for all files that don't have @format or @prettier
let g:prettier#autoformat_require_pragma = 0

""" Start NERDTree and put the cursor back in the other window
"autocmd VimEnter * NERDTree | wincmd p

""" Dark / Light Mode
"command Light :colorscheme NeoSolarized | :set background=light | :AirlineTheme solarized
"command Dark :colorscheme onedark | :set background=dark | :AirlineTheme onedark

""" Coc GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else 
    call CocAction('doHover')
  endif
endfunction

" use ctrl space to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" harpoon settings
nmap <leader>m :lua require('harpoon.mark').add_file()<CR>
nmap <leader>g :lua require('harpoon.ui').toggle_quick_menu()<CR>

" CSS Jump to definition
function! JumpToCSS()
  let id_pos = searchpos("id", "nb", line('.'))[1]
  let class_pos = searchpos("className", "nb", line('.'))[1]

  if class_pos > 0 || id_pos > 0
    if class_pos < id_pos
      execute ":vim '#".expand('<cword>')."' **/*.scss"
    elseif class_pos > id_pos
      execute ":vim '.".expand('<cword>')."' **/*.scss"
    endif
  endif
endfunction

nnoremap <leader>c :call JumpToCSS()<CR>

""" FixCursorHold
let g:cursorhold_updatetime = 100

Glaive codefmt plugin[mappings]

Glaive codefmt google_java_executable="java --add-exports jdk.compiler/com.sun.tools.javac.api=ALL-UNNAMED --add-exports jdk.compiler/com.sun.tools.javac.file=ALL-UNNAMED --add-exports jdk.compiler/com.sun.tools.javac.parser=ALL-UNNAMED --add-exports jdk.compiler/com.sun.tools.javac.tree=ALL-UNNAMED --add-exports jdk.compiler/com.sun.tools.javac.util=ALL-UNNAMED -jar /Users/rmcf/.jars/google-java-format.jar"
" Glaive codefmt google_java_executable="java -jar /Users/rmcf/.jars/google-java-format.jar"

" autoformatting
augroup autoformat_settings
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  autocmd FileType c,cpp AutoFormatBuffer clang-format
  autocmd FileType go AutoFormatBuffer gofmt
augroup END

" autoformatting for jsx
" command! -nargs=0 Prettier :CocCommand prettier.formatFile

"========================
"END PLUGIN CONFIGURATION
"========================

" set background transparent
" hi Normal ctermbg=NONE

" LSP configuration
lua << EOF
-- setup nvim-cmp
local cmp = require'cmp'

cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<C-y>'] = cmp.config.disable, -- If you want to remove the default `<C-y>` mapping, You can specify `cmp.config.disable` value.
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

local lspconfig = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  --buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

local configs = require 'lspconfig/configs'

if not configs.golangcilsp then
 	configs.golangcilsp = {
		default_config = {
			cmd = {'golangci-lint-langserver'},
			root_dir = lspconfig.util.root_pattern('.git', 'go.mod'),
			init_options = {
					command = { "golangci-lint", "run", "--enable-all", "--disable", "lll", "--out-format", "json" };
			}
		};
	}
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local servers = { "rust_analyzer", "tsserver", "hls", "jedi_language_server", "ccls", "cssls", "gopls", "golangcilsp" }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    capabilities = capabilities
  }
end



--capabilities.textDocument.completion.completionItem.snippetSupport = true
--lspconfig.cssls.setup {
--  on_attach = on_attach,
--  flags = {
--    debounce_text_changes = 150
--  },
--  capabilities = capabilities
--}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)
EOF
