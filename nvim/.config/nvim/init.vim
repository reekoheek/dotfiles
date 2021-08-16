"" GENNERAL
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
set showtabline=2
set guioptions-=e
set laststatus=2

set foldmethod=syntax
set foldlevelstart=99

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
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'mengelbrecht/lightline-bufferline'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'lewis6991/gitsigns.nvim'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'

" File editing
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jonsmithers/vim-html-template-literals'
Plug 'sheerun/vim-polyglot'
Plug 'kevinoid/vim-jsonc'
Plug 'honza/vim-snippets'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'ryanoasis/vim-devicons'
Plug 'kana/vim-textobj-user'
Plug 'PeterRincker/vim-argumentative'
Plug 'farmergreg/vim-lastplace'
Plug 'tpope/vim-obsession' " must be last

call plug#end()

"" CONFIGS
""----------------------------------------------------------------------------

" Gruvbox
let g:gruvbox_transparent_bg = 1
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
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
let g:lightline = {
	\ 'colorscheme': 'gruvbox',
	\ 'tabline': {'left': [['buffers']], 'right': [['']]},
	\ 'component_expand': {'buffers': 'lightline#bufferline#buffers'},
	\ 'component_type': {'buffers': 'tabsel'},
	\ 'component_raw': {'buffers': 1},
	\ 'separator': {'left': '', 'right': ''},
	\ 'subseparator': {'left': '', 'right': ''},
	\ }
let g:lightline#bufferline#show_number = 0
let g:lightline#bufferline#unnamed = '[noname]'
let g:lightline#bufferline#clickable = 1
let g:lightline#bufferline#enable_devicons = 1

" Go
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1 " Status line types/signatures.

" Autopairs
let g:AutoPairsFlyMode = 1

" Coc
let g:coc_global_extensions = [
	\ 'coc-css',
	\ 'coc-eslint',
	\ 'coc-json',
	\ 'coc-snippets',
	\ 'coc-tsserver',
	\ 'coc-prettier',
	\ 'coc-vimlsp',
	\ 'coc-explorer',
	\ 'coc-java',
	\ 'coc-kotlin',
	\ ]

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
require('telescope').setup({
defaults = {
	vimgrep_arguments = {
		'rg',
		'--ignore',
		'--hidden',
		'--color=never',
		'--no-heading',
		'--with-filename',
		'--line-number',
		'--column',
		'--smart-case'
		},
	prompt_prefix = '🔍',
	},
})
EOF

" Coc
" ---------------------------------------------------------------------------
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <C-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <C-space> coc#refresh()
else
  inoremap <silent><expr> <C-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<C-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<C-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<C-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" " Mappings for CoCList
" " Show all diagnostics.
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
