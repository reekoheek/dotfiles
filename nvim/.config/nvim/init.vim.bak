"" GENERAL
""----------------------------------------------------------------------------

set nocompatible

set history=1000
set mouse=a
set ttyfast
set lazyredraw
set timeoutlen=1000
set ttimeoutlen=0
set noerrorbells
set updatetime=300

set title
set relativenumber
set number
set cursorline
set scrolloff=8
set colorcolumn=80,120
set signcolumn=yes

set nowrap
set encoding=utf-8 nobomb
set nostartofline

set autoread
set nobackup
set nowritebackup
set noswapfile
set hidden

set backspace=indent,eol,start
set autoindent
set smartindent

set listchars=tab:▏\ ,trail:·
set list

set hlsearch
set incsearch
set inccommand=split
set wildmenu
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.psd
set wildignore+=*.pdf
set wildignore+=.DS_Store
set wildignore+=.git/*,node_modules/*,bower_components/*
set synmaxcol=2500

" set t_Co=256 " is a bad idea, set your terminal up properly instead.
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
set background=dark
set showmatch

set noshowmode
set noshowcmd
set noruler

set showtabline=2
set guioptions-=e
set laststatus=2

set foldmethod=syntax
set foldlevelstart=99
set completeopt=menuone,noselect

" Use system clipboard -  http://vim.wikia.com/wiki/Accessing_the_system_clipboard
let uname = substitute(system('uname'), '\n', '', '')
if uname == 'Darwin'
	set clipboard=unnamed " for macOS
elseif uname == 'Linux'
	set clipboard=unnamedplus " for linux
endif

filetype plugin indent on
syntax on

"" PRECONFIGS
""----------------------------------------------------------------------------

augroup fix_comments
	autocmd!
	autocmd FileType javascript setlocal commentstring=//\ %s
	autocmd FileType typescript setlocal commentstring=//\ %s
augroup end

augroup fix_autochdir
	autocmd!
	autocmd InsertEnter * let g:cwd = getcwd() | set autochdir
	autocmd InsertLeave * set noautochdir | execute 'cd' fnameescape(g:cwd)
augroup end

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

"" PLUGINS
""----------------------------------------------------------------------------

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
	silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

augroup plug
	autocmd!
	autocmd BufWritePost init.vim source %
augroup end

call plug#begin()

" Theme
Plug 'morhetz/gruvbox'
" Plug 'sainnhe/gruvbox-material'
" Plug 'itchyny/lightline.vim'
" Plug 'shinchu/lightline-gruvbox.vim'
" Plug 'mengelbrecht/lightline-bufferline'
Plug 'hoob3rt/lualine.nvim'
Plug 'akinsho/nvim-bufferline.lua'
" Plug 'romgrk/barbar.nvim'
Plug 'kyazdani42/nvim-web-devicons'
" Plug 'ryanoasis/vim-devicons'

Plug 'nvim-lua/plenary.nvim'

Plug 'nvim-telescope/telescope.nvim'
Plug 'lewis6991/gitsigns.nvim'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'cohama/lexima.vim'
" Plug 'jiangmiao/auto-pairs'

" File editing
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'ray-x/lsp_signature.nvim'
Plug 'SirVer/ultisnips'
Plug 'hrsh7th/nvim-compe'
Plug 'jonsmithers/vim-html-template-literals'
Plug 'sheerun/vim-polyglot'
Plug 'kevinoid/vim-jsonc'
Plug 'honza/vim-snippets'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'kana/vim-textobj-user'
Plug 'PeterRincker/vim-argumentative'
Plug 'dstein64/vim-startuptime'
Plug 'farmergreg/vim-lastplace'
Plug 'tpope/vim-obsession' " must be last

call plug#end()

"" CONFIGS
""----------------------------------------------------------------------------

" Gruvbox
let g:gruvbox_transparent_bg = 1
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
" let g:gruvbox_material_transparent_background = 1
" let g:gruvbox_material_background = 'hard'
" colorscheme gruvbox-material
highlight Normal guibg=NONE ctermbg=NONE

" textobj
call textobj#user#plugin('backticks', {
\   'backticks-a': {
\     'pattern': '`\_.\{-}`',
\     'select': 'a`',
\   },
\   'backticks-i': {
\     'pattern': '`\zs\_.\{-}\ze`',
\     'select': 'i`',
\   },
\ })

call textobj#user#plugin('line', {
\   '-': {
\     'select-a-function': 'CurrentLineA',
\     'select-a': 'al',
\     'select-i-function': 'CurrentLineI',
\     'select-i': 'il',
\   },
\ })

function! CurrentLineA()
  normal! 0
  let head_pos = getpos('.')
  normal! $
  let tail_pos = getpos('.')
  return ['v', head_pos, tail_pos]
endfunction

function! CurrentLineI()
  normal! ^
  let head_pos = getpos('.')
  normal! g_
  let tail_pos = getpos('.')
  let non_blank_char_exists_p = getline('.')[head_pos[2] - 1] !~# '\s'
  return
  \ non_blank_char_exists_p
  \ ? ['v', head_pos, tail_pos]
  \ : 0
endfunction

" Lightline
" let g:lightline = {
" 	\ 'colorscheme': 'gruvbox',
" 	\ 'tabline': {'left': [['buffers']], 'right': [['']]},
" 	\ 'component_expand': {'buffers': 'lightline#bufferline#buffers'},
" 	\ 'component_type': {'buffers': 'tabsel'},
" 	\ 'component_raw': {'buffers': 1},
" 	\ 'separator': {'left': '', 'right': ''},
" 	\ 'subseparator': {'left': '', 'right': ''},
" 	\ }
" let g:lightline#bufferline#show_number = 0
" let g:lightline#bufferline#unnamed = '[noname]'
" let g:lightline#bufferline#clickable = 1
" let g:lightline#bufferline#enable_devicons = 1

" Go
" let g:go_fmt_command = "goimports"
" let g:go_auto_type_info = 1 " Status line types/signatures.

"" MAPS
""----------------------------------------------------------------------------

noremap <space> <nop>
let mapleader=' '

nnoremap <silent> Q <nop>
nnoremap Y y$
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>
inoremap <C-C> <esc>
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
nnoremap <A-j> :m +1<CR>==
nnoremap <A-k> :m -2<CR>==
inoremap <A-j> <esc>:m +1<CR>==a
inoremap <A-k> <esc>:m -2<CR>==a
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ? ?<C-g>u
inoremap ! !<C-g>u

nmap [a <Plug>Argumentative_Prev
nmap ]a <Plug>Argumentative_Next
xmap [a <Plug>Argumentative_XPrev
xmap ]a <Plug>Argumentative_XNext
nmap <a <Plug>Argumentative_MoveLeft
nmap >a <Plug>Argumentative_MoveRight
xmap ia <Plug>Argumentative_InnerTextObject
xmap aa <Plug>Argumentative_OuterTextObject
omap ia <Plug>Argumentative_OpPendingInnerTextObject
omap aa <Plug>Argumentative_OpPendingOuterTextObject

nnoremap <silent> <leader>p :<C-u>Telescope find_files find_command=rg,-g,!.git/,--ignore,--hidden,--files<CR>
nnoremap <silent> <leader>f :<C-u>Telescope live_grep<CR>
nnoremap <silent> <leader>e :<C-u>Telescope file_browser hidden=1<CR>
nnoremap <silent> <C-L> :<C-u>let @/ = "" <Bar> nohl<CR><C-L>
nnoremap g/ :<C-u>%s//g<Left><Left>

nnoremap <silent> <leader><leader> <C-^>
nnoremap <silent> <leader>j :<C-u>bprev<CR>
nnoremap <silent> <leader>k :<C-u>bnext<CR>
nnoremap <silent> <leader>h :<C-u>bfirst<CR>
nnoremap <silent> <leader>l :<C-u>blast<CR>
nnoremap <silent> <leader>d :<C-u>bd<cr>

lua <<EOF
require('gitsigns').setup()
require('lualine').setup()
require("bufferline").setup{}
require'nvim-treesitter.configs'.setup { highlight = { enable = true } }
EOF

" source ~/.config/nvim/config/coc.vim
source ~/.config/nvim/config/telescope.vim
luafile ~/.config/nvim/lua/config/lsp.lua
